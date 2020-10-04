module GetAccept
  class File < Resource
    def upload data
      post('/upload', data)
    end
  end
end
