json.array!(@calendar_services) do |service|
  json.extract! service, :id, :name, :start_date, :end_date
  json.title service.name
  json.start service.start_date
  json.end service.end_date
  json.url user_service_url(service.user_id, service, format: :html)
end