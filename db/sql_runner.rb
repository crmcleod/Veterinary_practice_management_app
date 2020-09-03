require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'dcgdn7lvd3f1ra', host: 'ec2-54-216-202-161.eu-west-1.compute.amazonaws.com', port: 5432, user: 'kfwmtfyowheatr',
        password: 'f074a22a16d59a7941b776e8bcb0b58501a5e29d69ebc396c9ef0abb662c56cc'
        })
      result = db.exec(sql)
    ensure
      db.close() if db != nil
    end
    return result
  end

end