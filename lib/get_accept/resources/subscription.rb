module GetAccept
  class Subscription < Resource
    def all
      get('/subscriptions')
    end

    def create options = {}
      post('/subscriptions', options)
    end

    def find id
      get("/subscriptions/#{id}")
    end

    def destroy id
      delete("/subscriptions/#{id}")
    end
  end
end
