json.extract! invoice, :id, :name, :description, :service_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)