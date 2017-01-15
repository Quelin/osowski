json.array!(@services) do |service|
  json.extract! service, :id, :name, :start_date, :end_date
  json.title service.name
  json.start service.start_date
  json.end service.end_date
  json.url service_path(user: @user.id format: :html)
end