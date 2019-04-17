require('pg')

class SqlRunner

  def self.run(sql, values = [])
    #Connect to the database
    begin
    db = PG.connect(host: 'localhost', dbname: 'rental_shop')
    #prepare the sql statement ready for execution
    db.prepare('query', sql)
    #execute the prepared statement with values
    results = db.exec_prepared('query', values)
    #ensure the connection to the database closes
    ensure
      db.close() if db != nil
    end
    return results
  end
end
