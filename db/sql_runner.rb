require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'df1b1fpld8s6a7', 
        host: 'ec2-3-248-4-172.eu-west-1.compute.amazonaws.com', 
        port: 5432, 
        user: 'onbdnrjflwehfx',
        password: '15aabee68c62ed545d87494caa60f919ae67a9ce34c1942d97cf6713e91dce55'
        })
      # db = PG.connect({dbname: 'pace_vma', host: 'localhost'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end