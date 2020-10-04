module GetAccept
  class Template < Resource
    def all
      get('/templates')
    end

    def edit_url id
      "https://app.getaccept.com/template/edit/#{id}"
    end
  end
end
