# Brief:
## Vet Management App
    A veterinary practice has approached you to build a web application to help them manage their animals and vets. 

To run this app you will require Ruby, Postgres and Sinatra to be installed on your device.
In your mac terminal you will need to carry out the following:
   * createdb pace_vma [enter]
   * psql -d pace_vma -f db/pace.sql [enter]
   * psql -d pace_vma -f db/pace.sql [enter]
   * ruby db/seeds.rb [enter]
   * ruby app.rb
    
Sinatra will now use your device as a local server for the app to run.
In your preferred web browser paste the following link into the address bar and begin using the app.
    http://localhost:4567/
    
To terminate sinatra in the terminal, either press control^c or exit the terminal and terminate the process.
