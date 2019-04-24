require('pg')

class SqlRunner

  def self.run(sql, values = [])
    #Connect to the database
    begin
    db = PG.connect(host: 'ec2-54-227-245-146.compute-1.amazonaws.com
      ', dbname: 'd5daqm9k1mm4q2', port: 5432, user: 'krtsfgfklqezta', password: 'f153fcec8a943a7f8217c67b897051e370e29925e40547fbd45eb56573738f24')
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
