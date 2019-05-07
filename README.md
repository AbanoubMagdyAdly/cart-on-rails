# Cart-On-Rails

## eCommerce Platform - Using Rails alongside Angular 7

Things you may want to know:

* Angular version 7.1

* Ruby version '2.6.1'

* Rails 5.2.x

* MySQL
  
 ### use this commend to install missing gems
```
bundle install
```
### then set your local .env file 
```
export DATABASE_USERNAME=<username>
export DATABASE_PASSWORD=<password>
export DATABASE_NAME=<cart-on-rails>

```

### then run following commend
```
rails db:migrate

rails db:seed
```

## Now you can use it 
```
rails s 
```

To go to admin page navigate to localhost:3000/admin
# Have Fun ....
