class AnalyticsController < ApplicationController
  def dashboard
    @country = params[:country] || "USA"
    @job_title = params[:job_title] || "Software Engineer"

    # 1. Country Metrics
    country_scope = Employee.where(country: @country)
    @stats = country_scope.select("AVG(salary) as avg, MIN(salary) as min, MAX(salary) as max")[0]

    # 2. Specific Job Title Average in Country
    @job_avg = country_scope.where(job_title: @job_title).average(:salary)

    # 3. Meaningful Metric: Departmental Spend
    @dept_spend = country_scope.group(:department).sum(:salary)
  end
end
