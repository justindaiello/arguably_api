class Poll <ApplicationRecord

  # connect to postgres
  DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'arguably_api_development'})

  #READ/SHOW all
  def self.all
    results = DB.exec("SELECT * FROM polls;")
    return results.map do |result|
      {
        "id"              => result["id"].to_i,
        "question"        => result["question"],
        "answers"         => result["answers"],
        "bullet_points1"  => result["bullet_points1"],
        "bullet_points2"  => result["bullet_points2"],
        "image"           => result["image"]
      }
    end
  end

  #READ/SHOW one
  def self.find(id)
    results = DB.exec("SELECT * FROM polls WHERE id=#{id};")
    return {
      "id"              => results.first["id"].to_i,
      "question"        => results.first["question"],
      "answers"         => results.first["answers"],
      "bullet_points1"  => results.first["bullet_points1"],
      "bullet_points2"  => results.first["bullet_points2"],
      "image"           => results.first["image"]
    }
  end


end
