module GetAccept
  class Document < Resource
    def all
      get('/documents')
    end

    def find id
      get("/documents/#{id}")
    end

    def preview id
      post("/documents/#{id}/preview")
    end

    def find_by_external_id external_id
      get("/documents/external/#{external_id}")
    end

    def create data
      post('/documents', data)
    end

    def send id
      post("/documents/#{id}/send")
    end

    def recipients id
      get("/documents/#{id}/recipients")
    end

    def view_url id
      "https://app.getaccept.com/document/view/#{id}"
    end

    def destroy id
      delete("/documents/#{id}")
    end
  end
end
