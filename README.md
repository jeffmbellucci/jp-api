# Jurassic Park API

- API is built with Rails 7, Ruby 3.1.2 and GIT.
- Database is Postgres.
- There is an included `seeds.rb` file that can be run after DB setup/migration to populate the DB with all the required dinosaur species and some cages.

- I got done with family Xmas obligations last night, and this is what I was able to get finished in about 2ish hours this afternoon:

- Cages have a maximum capacity for how many dinosaurs it can hold.
- Cages know how many dinosaurs are contained via `dinosaur_count` key in response body.
- Cages have a power status of ACTIVE or DOWN, stored with an `enum`.
- Cages cannot be powered off if they contain dinosaurs.
- Dinosaurs cannot be created/edited into a cage that is powered down or at capacity.
- Extra: This wasn't mentioned, but it made sense to prevent deletion of a cage that had dinosaurs in it.
- Must be able to query a listing of dinosaurs in a specific cage. Example cage `show` response:
```javascript
{"cage":{"id":1,"power_status":"active","capacity":6,"created_at":"2022-12-27T21:41:52.761Z","updated_at":"2022-12-27T21:41:52.761Z"},"dinosaurs":[{"id":1,"name":"Rex","species":"tyrannosaurus","diet":"carnivore","cage_id":1,"created_at":"2022-12-27T21:41:52.800Z","updated_at":"2022-12-27T21:41:52.800Z"},{"id":2,"name":"Blue","species":"velociraptor","diet":"carnivore","cage_id":1,"created_at":"2022-12-27T21:41:52.809Z","updated_at":"2022-12-27T21:41:52.809Z"},{"id":3,"name":"Spiny","species":"spinosaurus","diet":"carnivore","cage_id":1,"created_at":"2022-12-27T21:41:52.813Z","updated_at":"2022-12-27T21:41:52.813Z"},{"id":4,"name":"Meg","species":"megalosaurus","diet":"carnivore","cage_id":1,"created_at":"2022-12-27T21:41:52.818Z","updated_at":"2022-12-27T21:41:52.818Z"}],"dinosaur_count":4}
```
What I partially got to:
- *Automated tests that ensure the business logic implemented is correct.*  There are some automated tests that were generated when I made the controllers, which were partially failing, so I made sure all are now passing when you run `rake tests`, but getting to comprehensively testing all edge cases and scenarios would have taken me longer than the allotted time, if I'm being honest.  I know testing is important, and I usually have solid test coverage with enterprise code, but I wanted to get the majority of the requested functionality working.  If this was an enterprise API, I would have used additional time to add much more testing before considering deploying it.

What I did not get to:
- *When querying dinosaurs or cages they should be filterable on their attributes*
(Cages on their power status and dinosaurs on species). I felt this was less important since getting a cage will show it's power status and all it's dinosaurs with attributes which could be parsed appropriately by the front-end.  I generally feel in most cases it is better to return more json data than less when the response is still relatively short.  Obviously, this would not hold true if we were returning 1000's of cages and dinosaurs, in which case filtering on the back end would be way more important.  However, I had to prioritize a few things for times sake, and I chose to leave this one out.  If I were to implement it, I would use `where` clauses, ie.```@cages.where(power_status: :active)```, ```@dinosaurs.where(species: :velociraptor)```, etc.

#### I decided I would deploy this to Heroku since I've gotten pretty fast at it, so you can play with it live, if you want. The root url goes to the cage index, so you can get a quick view of all the cage statuses, which I would think would be important, based on the movie plot. :)

[All cage statuses](https://jurassic-api.herokuapp.com/)<br>
[First example cage](https://jurassic-api.herokuapp.com/cages/1)<br>
[First example dinosaur](https://jurassic-api.herokuapp.com/dinosaurs/1)
