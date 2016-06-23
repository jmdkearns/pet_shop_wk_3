require ('pg')
# require ('pry-byebug')

class PetStore

  attr_reader(:name, :address, :stock_type)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

  def save()
    sql = "INSERT INTO pet_stores (name, address, stock_type) VALUES ( '#{ @name }', '#{ @address }', '#{ @stock_type }' ) RETURNING *"
    db = PG.connect( {dbname:'pet_stores', host:'localhost'})
    db.exec( sql )
    db.close()
  end

  def all()
    sql = "SELECT * FROM pet_stores"
    db = PG.connect( {dbname:'pet_stores', host:'localhost'})
    db.exec( sql )
    db.close()
  end

end

pet_store1 = PetStore.new({'name' => 'pet_store1', 'address' => 'Aberdeen', 'stock_type' => 'aquatic'})
pet_store1.save()

# binding.pry
# nil