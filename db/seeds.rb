# mike = User.create(username: "mike", email: "mike@moo.com", password: "123")
# annie = User.create(username: "AnnieAntifa", email: "ann@moo.com", password: "789")
# bruce = User.create(username: "BlackBlocBruce", email: "bruce@moo.com", password: "456")

Protest.create(name: "BLM", location: "San Francisco, Civic Center", description: "protest police brutality", date: '2020-11-20', time: "9pm", user_id: 1)
Protest.create(name: "march against war", location: "NYC, UN hq", description: "stop the bombing in Yemen", date: '2020-12-15', time: "10am",  user_id: 2)
Protest.create(name: "Womans March", location: "DC, whitehouse", description: "march for womens rights", date: '2020-12-02', time: "11am",  user_id: 2)
Protest.create(name: "Solidarity with Armenia", location: "Downtown LA", description: "Stop the war crimes being committed in Armenia by Azerbaijan", date: '2020-11-20', time: "noon",  user_id: 3)
Protest.create(name: "Shut down ICE", location: "San Francisco, ICE building", description: "close the ICE concentration camps", date: '2020-11-14', time: "1pm",  user_id: 1)