require 'json/ext'
class Poll

  # connect to postgres
  if(ENV['DATABASE_URL'])
    uri = URI.parse(ENV['DATABASE_URL'])
    DB = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)
    else
    DB = PG.connect(host: "localhost", port: 5432, dbname: 'arguably_api_development')
  end

  # DB = PG.connect({:host => "localhost", :port => 5432, :dbname => 'arguably_api_development'})

  #READ/SHOW all
  def self.all
    results = DB.exec("SELECT * FROM polls;")
    return results.map do |result|
      {
        "id"              => result["id"].to_i,
        "question"        => result["question"],
        "answer1"         => result["answer1"],
        "answer2"         => result["answer2"],
        "bp1"             => result["bp1"],
        "bp2"             => result["bp2"],
        "bp3"             => result["bp3"],
        "bp4"             => result["bp4"],
        "bp5"             => result["bp5"],
        "bp6"             => result["bp6"],
        "image"           => result["image"],
        "open"            => result["open"]
      }
    end
  end

  #READ/SHOW one
  def self.find(id)
    results = DB.exec("SELECT * FROM polls WHERE id=#{id};")
    return {
      "id"              => results.first["id"].to_i,
      "question"        => results.first["question"],
      "answer1"         => results.first["answer1"],
      "answer2"         => results.first["answer2"],
      "bp1"             => results.first["bp1"],
      "bp2"             => results.first["bp2"],
      "bp3"             => results.first["bp3"],
      "bp4"             => results.first["bp4"],
      "bp5"             => results.first["bp5"],
      "bp6"             => results.first["bp6"],
      "image"           => results.first["image"],
      "open"            => results.first["open"]
    }
  end

  #CREATE a poll
  def self.create(opts)
    results = DB.exec(
      <<-SQL
        INSERT INTO polls (question, answer1, answer2, bp1, bp2, bp3, bp4, bp5, bp6, image, open)
        VALUES ('#{opts["question"]}', '#{opts["answer1"]}', '#{opts["answer2"]}', '#{opts["bp1"]}', '#{opts["bp2"]}', '#{opts["bp3"]}',  '#{opts["bp4"]}', '#{opts["bp5"]}', '#{opts["bp6"]}', '#{opts["image"]}', '#{opts["open"]}')
        RETURNING id, question, answer1, answer2, bp1, bp2, bp3, bp4, bp5, bp6, image, open
      SQL
    )
    return {
      "id"              => results.first["id"].to_i,
      "question"        => results.first["question"],
      "answer1"         => results.first["answer1"],
      "answer2"         => results.first["answer2"],
      "bp1"             => results.first["bp1"],
      "bp2"             => results.first["bp2"],
      "bp3"             => results.first["bp3"],
      "bp4"             => results.first["bp4"],
      "bp5"             => results.first["bp5"],
      "bp6"             => results.first["bp6"],
      "image"           => results.first["image"],
      "open"            => results.first["open"]
    }
  end

  #DELETE a poll
  def self.delete(id)
    results = DB.exec("DELETE FROM polls where id=#{id};")
    return { "deleted" => true }
  end

  #UPDATE a poll
  def self.update(id, opts)
    results = DB.exec(
      <<-SQL
        UPDATE polls
        SET question='#{opts["question"]}',
            answer1='#{opts["answer1"]}',
            answer2='#{opts["answer2"]}',
            bp1='#{opts["bp1"]}',
            bp2='#{opts["bp2"]}',
            bp3='#{opts["bp3"]}',
            bp4='#{opts["bp4"]}',
            bp5='#{opts["bp5"]}',
            bp6='#{opts["bp6"]}',
            image='#{opts["image"]}',
            open='#{opts["open"]}'
        WHERE id=#{id}
        RETURNING id, question, answer1, answer2 bp1, bp2, bp3, bp4, bp5, bp6, image;
      SQL
    )
    return {
      "id"              => results.first["id"].to_i,
      "question"        => results.first["question"],
      "answer1"         => results.first["answer1"],
      "answer2"         => results.first["answer2"],
      "bp1"             => results.first["bp1"],
      "bp2"             => results.first["bp2"],
      "bp3"             => results.first["bp3"],
      "bp4"             => results.first["bp4"],
      "bp5"             => results.first["bp5"],
      "bp6"             => results.first["bp6"],
      "image"           => results.first["image"],
      "open"            => results.first["open"]
    }
  end

end
