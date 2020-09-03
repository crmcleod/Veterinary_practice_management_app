require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'dcgdn7lvd3f1ra', host: 'ec2-54-216-202-161.eu-west-1.compute.amazonaws.com'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end