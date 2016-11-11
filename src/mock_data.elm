module Mock_data exposing (..)

import Date exposing (Month(..))
import Date.Extra as Date

import Derektor.Data as Data

mockedJobs : List Data.Job -> Data.Jobs
mockedJobs jobList =
  List.map (\job -> {
    uuid = job.uuid
  , name = job.name
  , locked = job.locked
  , lastEdited = job.lastEdited 
  }) jobList 

mockedJobList : List Data.Job
mockedJobList =
  [ { name = "Oloo"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-25" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 1</p>"
    , query = "wfowler0@cmu.edu"
    , review = "Wanda Fowler"
    , schedule = "2016-10-13"
    , recipients = ["wfowler0@amazon.com"]
    }
  , { name = "Quatz"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-12-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 2</p>"
    , query = "tgraham1@canalblog.com"
    , review = "Thomas Graham"
    , schedule = "2016-09-28"
    , recipients = ["tgraham1@adobe.com"]
    }
  , { name = "Jayo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-07" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 3</p>"
    , query = "mweaver2@imgur.com"
    , review = "Michael Weaver"
    , schedule = "2016-09-08"
    , recipients = ["mweaver2@naver.com"]
    }
  , { name = "Meetz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-11-17" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 4</p>"
    , query = "bpayne3@freewebs.com"
    , review = "Brandon Payne"
    , schedule = "2016-04-01"
    , recipients = ["bpayne3@mysql.com"]
    }
  , { name = "Npath"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-12" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 5</p>"
    , query = "bdiaz4@about.me"
    , review = "Bobby Diaz"
    , schedule = "2016-06-27"
    , recipients = ["bdiaz4@un.org"]
    }
  , { name = "Reallinks"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-07-06" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 6</p>"
    , query = "mgardner5@salon.com"
    , review = "Martin Gardner"
    , schedule = "2016-10-06"
    , recipients = ["mgardner5@elegantthemes.com"]
    }
  , { name = "Roomm"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-04-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 7</p>"
    , query = "rruiz6@spiegel.de"
    , review = "Ruby Ruiz"
    , schedule = "2016-05-25"
    , recipients = ["rruiz6@tumblr.com"]
    }
  , { name = "Rhyzio"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-04-27" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 8</p>"
    , query = "jstewart7@mediafire.com"
    , review = "Joyce Stewart"
    , schedule = "2016-09-04"
    , recipients = ["jstewart7@google.es"]
    }
  , { name = "Yotz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-31" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 9</p>"
    , query = "rchavez8@state.gov"
    , review = "Ralph Chavez"
    , schedule = "2016-06-24"
    , recipients = ["rchavez8@webmd.com"]
    }
  , { name = "Yata"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-01-19" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 10</p>"
    , query = "jjohnson9@about.com"
    , review = "Joyce Johnson"
    , schedule = "2016-05-13"
    , recipients = ["jjohnson9@wired.com"]
    }
  , { name = "Meemm"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-23" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 11</p>"
    , query = "abrowna@furl.net"
    , review = "Alice Brown"
    , schedule = "2016-09-11"
    , recipients = ["abrowna@weebly.com"]
    }
  , { name = "Shufflester"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-28" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 12</p>"
    , query = "ncruzb@java.com"
    , review = "Nancy Cruz"
    , schedule = "2016-09-24"
    , recipients = ["ncruzb@ustream.tv"]
    }
  , { name = "Trilith"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-09-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 13</p>"
    , query = "chillc@exblog.jp"
    , review = "Christine Hill"
    , schedule = "2016-10-13"
    , recipients = ["chillc@freewebs.com"]
    }
  , { name = "Dazzlesphere"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-10-19" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 14</p>"
    , query = "frobertsd@about.me"
    , review = "Fred Roberts"
    , schedule = "2016-10-28"
    , recipients = ["frobertsd@engadget.com"]
    }
  , { name = "Zoombox"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-05-22" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 15</p>"
    , query = "swarde@java.com"
    , review = "Sandra Ward"
    , schedule = "2016-08-29"
    , recipients = ["swarde@sciencedaily.com"]
    }
  , { name = "Meedoo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-07-30" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 16</p>"
    , query = "tjonesf@xing.com"
    , review = "Terry Jones"
    , schedule = "2016-10-30"
    , recipients = ["tjonesf@people.com.cn"]
    }
  , { name = "Jetwire"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-09-12" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 17</p>"
    , query = "eknightg@quantcast.com"
    , review = "Emily Knight"
    , schedule = "2016-10-25"
    , recipients = ["eknightg@elpais.com"]
    }
  , { name = "Flipbug"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-09-27" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 18</p>"
    , query = "dmoralesh@indiegogo.com"
    , review = "Diane Morales"
    , schedule = "2016-10-12"
    , recipients = ["dmoralesh@prweb.com"]
    }
  , { name = "Meeveo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 19</p>"
    , query = "lpricei@seesaa.net"
    , review = "Louise Price"
    , schedule = "2016-08-14"
    , recipients = ["lpricei@jimdo.com"]
    }
  , { name = "Flashpoint"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-01-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 20</p>"
    , query = "kkimj@bandcamp.com"
    , review = "Kelly Kim"
    , schedule = "2016-06-03"
    , recipients = ["kkimj@washingtonpost.com"]
    }
  , { name = "Twimm"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-12-31" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 21</p>"
    , query = "hduncank@businessinsider.com"
    , review = "Howard Duncan"
    , schedule = "2016-05-30"
    , recipients = ["hduncank@nasa.gov"]
    }
  , { name = "Aimbo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-28" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 22</p>"
    , query = "eyoungl@blogtalkradio.com"
    , review = "Eric Young"
    , schedule = "2016-07-29"
    , recipients = ["eyoungl@senate.gov"]
    }
  , { name = "Katz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-11-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 23</p>"
    , query = "cgeorgem@bravesites.com"
    , review = "Craig George"
    , schedule = "2016-05-27"
    , recipients = ["cgeorgem@cyberchimps.com"]
    }
  , { name = "Oyope"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-11-21" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 24</p>"
    , query = "cjenkinsn@taobao.com"
    , review = "Christine Jenkins"
    , schedule = "2016-09-27"
    , recipients = ["cjenkinsn@github.com"]
    }
  , { name = "Jabbersphere"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-25" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 25</p>"
    , query = "wwarreno@vinaora.com"
    , review = "William Warren"
    , schedule = "2016-09-30"
    , recipients = ["wwarreno@e-recht24.de"]
    }
  , { name = "Quinu"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 26</p>"
    , query = "jburtonp@unblog.fr"
    , review = "Jean Burton"
    , schedule = "2016-09-07"
    , recipients = ["jburtonp@fotki.com"]
    }
  , { name = "Edgeblab"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-11-22" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 27</p>"
    , query = "pkennedyq@google.com.hk"
    , review = "Paul Kennedy"
    , schedule = "2016-01-24"
    , recipients = ["pkennedyq@wix.com"]
    }
  , { name = "Vitz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-19" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 28</p>"
    , query = "fwestr@buzzfeed.com"
    , review = "Frances West"
    , schedule = "2016-07-27"
    , recipients = ["fwestr@sogou.com"]
    }
  , { name = "Gigabox"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-05-20" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 29</p>"
    , query = "ahowards@accuweather.com"
    , review = "Angela Howard"
    , schedule = "2016-08-05"
    , recipients = ["ahowards@cnn.com"]
    }
  , { name = "Midel"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-11-02" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 30</p>"
    , query = "pbrownt@infoseek.co.jp"
    , review = "Paula Brown"
    , schedule = "2016-11-05"
    , recipients = ["pbrownt@vkontakte.ru"]
    }
  , { name = "Latz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-10-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 31</p>"
    , query = "aparkeru@apple.com"
    , review = "Ashley Parker"
    , schedule = "2016-10-16"
    , recipients = ["aparkeru@loc.gov"]
    }
  , { name = "Dabfeed"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-11-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 32</p>"
    , query = "cgriffinv@opensource.org"
    , review = "Christine Griffin"
    , schedule = "2016-11-04"
    , recipients = ["cgriffinv@hubpages.com"]
    }
  , { name = "Skalith"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-05-24" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 33</p>"
    , query = "kfullerw@stumbleupon.com"
    , review = "Kimberly Fuller"
    , schedule = "2016-11-06"
    , recipients = ["kfullerw@mlb.com"]
    }
  , { name = "Rhynyx"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-06-09" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 34</p>"
    , query = "nwallacex@mozilla.com"
    , review = "Nancy Wallace"
    , schedule = "2016-10-11"
    , recipients = ["nwallacex@google.com"]
    }
  , { name = "Bubbletube"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 35</p>"
    , query = "mfieldsy@about.me"
    , review = "Mark Fields"
    , schedule = "2016-05-16"
    , recipients = ["mfieldsy@bandcamp.com"]
    }
  , { name = "Cogilith"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-09-23" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 36</p>"
    , query = "cromeroz@seesaa.net"
    , review = "Christina Romero"
    , schedule = "2016-10-01"
    , recipients = ["cromeroz@goo.ne.jp"]
    }
  , { name = "Babblestorm"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-03-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 37</p>"
    , query = "fpeterson10@theglobeandmail.com"
    , review = "Frank Peterson"
    , schedule = "2016-03-16"
    , recipients = ["fpeterson10@dailymail.co.uk"]
    }
  , { name = "Feedmix"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-04-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 38</p>"
    , query = "kwheeler11@ucla.edu"
    , review = "Kathleen Wheeler"
    , schedule = "2016-05-26"
    , recipients = ["kwheeler11@ezinearticles.com"]
    }
  , { name = "Plajo"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-03-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 39</p>"
    , query = "rgrant12@microsoft.com"
    , review = "Roger Grant"
    , schedule = "2016-10-23"
    , recipients = ["rgrant12@bloglines.com"]
    }
  , { name = "Voomm"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-03-17" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 40</p>"
    , query = "lhernandez13@nature.com"
    , review = "Lori Hernandez"
    , schedule = "2016-04-23"
    , recipients = ["lhernandez13@boston.com"]
    }
  , { name = "Rooxo"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-06-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 41</p>"
    , query = "folson14@cisco.com"
    , review = "Frances Olson"
    , schedule = "2016-08-14"
    , recipients = ["folson14@flickr.com"]
    }
  , { name = "Tazz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-12" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 42</p>"
    , query = "ahunt15@booking.com"
    , review = "Angela Hunt"
    , schedule = "2016-06-06"
    , recipients = ["ahunt15@oracle.com"]
    }
  , { name = "Edgetag"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-04-29" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 43</p>"
    , query = "eoliver16@uiuc.edu"
    , review = "Ernest Oliver"
    , schedule = "2016-06-07"
    , recipients = ["eoliver16@hexun.com"]
    }
  , { name = "Quimm"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-10-02" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 44</p>"
    , query = "jday17@nationalgeographic.com"
    , review = "Joshua Day"
    , schedule = "2016-10-23"
    , recipients = ["jday17@newsvine.com"]
    }
  , { name = "Aivee"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-23" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 45</p>"
    , query = "cwilliams18@cornell.edu"
    , review = "Christine Williams"
    , schedule = "2016-09-07"
    , recipients = ["cwilliams18@telegraph.co.uk"]
    }
  , { name = "Oyope"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-15" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 46</p>"
    , query = "pjames19@wikispaces.com"
    , review = "Patricia James"
    , schedule = "2016-05-13"
    , recipients = ["pjames19@tamu.edu"]
    }
  , { name = "Feednation"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-01-09" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 47</p>"
    , query = "lprice1a@nytimes.com"
    , review = "Lois Price"
    , schedule = "2016-06-07"
    , recipients = ["lprice1a@google.com.au"]
    }
  , { name = "Mycat"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-28" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 48</p>"
    , query = "anguyen1b@pcworld.com"
    , review = "Ashley Nguyen"
    , schedule = "2016-11-02"
    , recipients = ["anguyen1b@deviantart.com"]
    }
  , { name = "Katz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-11-04" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 49</p>"
    , query = "hgreen1c@newsvine.com"
    , review = "Helen Green"
    , schedule = "2016-11-05"
    , recipients = ["hgreen1c@mysql.com"]
    }
  , { name = "Buzzbean"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-19" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 50</p>"
    , query = "aarnold1d@wikia.com"
    , review = "Alan Arnold"
    , schedule = "2016-04-06"
    , recipients = ["aarnold1d@psu.edu"]
    }
  , { name = "Skilith"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-12-14" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 51</p>"
    , query = "ebrown1e@slideshare.net"
    , review = "Evelyn Brown"
    , schedule = "2016-09-01"
    , recipients = ["ebrown1e@prnewswire.com"]
    }
  , { name = "Twitterlist"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-04-05" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 52</p>"
    , query = "abennett1f@wsj.com"
    , review = "Anna Bennett"
    , schedule = "2016-08-24"
    , recipients = ["abennett1f@imgur.com"]
    }
  , { name = "Trunyx"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-06-20" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 53</p>"
    , query = "pcruz1g@qq.com"
    , review = "Peter Cruz"
    , schedule = "2016-07-11"
    , recipients = ["pcruz1g@moonfruit.com"]
    }
  , { name = "Topicware"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-06-25" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 54</p>"
    , query = "nstevens1h@wikipedia.org"
    , review = "Norma Stevens"
    , schedule = "2016-07-30"
    , recipients = ["nstevens1h@sakura.ne.jp"]
    }
  , { name = "Realcube"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-10-26" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 55</p>"
    , query = "jwatkins1i@twitter.com"
    , review = "Jose Watkins"
    , schedule = "2016-11-07"
    , recipients = ["jwatkins1i@exblog.jp"]
    }
  , { name = "Midel"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-10-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 56</p>"
    , query = "nwilson1j@sina.com.cn"
    , review = "Nicole Wilson"
    , schedule = "2016-11-02"
    , recipients = ["nwilson1j@histats.com"]
    }
  , { name = "Oloo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-10-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 57</p>"
    , query = "bmoore1k@spiegel.de"
    , review = "Benjamin Moore"
    , schedule = "2016-11-07"
    , recipients = ["bmoore1k@dyndns.org"]
    }
  , { name = "Katz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-28" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 58</p>"
    , query = "kortiz1l@ed.gov"
    , review = "Karen Ortiz"
    , schedule = "2016-06-30"
    , recipients = ["kortiz1l@angelfire.com"]
    }
  , { name = "Topicware"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-12-08" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 59</p>"
    , query = "cgreen1m@moonfruit.com"
    , review = "Carolyn Green"
    , schedule = "2016-06-09"
    , recipients = ["cgreen1m@usgs.gov"]
    }
  , { name = "Talane"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-02-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 60</p>"
    , query = "lferguson1n@creativecommons.org"
    , review = "Larry Ferguson"
    , schedule = "2016-07-18"
    , recipients = ["lferguson1n@digg.com"]
    }
  , { name = "Gevee"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 61</p>"
    , query = "lrice1o@nps.gov"
    , review = "Laura Rice"
    , schedule = "2016-01-19"
    , recipients = ["lrice1o@gmpg.org"]
    }
  , { name = "Dabjam"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-09-22" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 62</p>"
    , query = "kalexander1p@gizmodo.com"
    , review = "Kathleen Alexander"
    , schedule = "2016-09-25"
    , recipients = ["kalexander1p@linkedin.com"]
    }
  , { name = "Brainbox"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 63</p>"
    , query = "rross1q@arizona.edu"
    , review = "Ronald Ross"
    , schedule = "2016-08-23"
    , recipients = ["rross1q@unc.edu"]
    }
  , { name = "Yamia"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-01" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 64</p>"
    , query = "rsullivan1r@gravatar.com"
    , review = "Raymond Sullivan"
    , schedule = "2016-06-27"
    , recipients = ["rsullivan1r@tamu.edu"]
    }
  , { name = "Abatz"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-01-17" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 65</p>"
    , query = "jbailey1s@dot.gov"
    , review = "Janice Bailey"
    , schedule = "2016-11-03"
    , recipients = ["jbailey1s@mozilla.com"]
    }
  , { name = "Babbleopia"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-12-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 66</p>"
    , query = "jwatkins1t@bravesites.com"
    , review = "Joseph Watkins"
    , schedule = "2016-06-20"
    , recipients = ["jwatkins1t@weibo.com"]
    }
  , { name = "Skilith"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-03-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 67</p>"
    , query = "jshaw1u@marketwatch.com"
    , review = "Judith Shaw"
    , schedule = "2016-05-07"
    , recipients = ["jshaw1u@cpanel.net"]
    }
  , { name = "Voolia"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-21" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 68</p>"
    , query = "sgraham1v@newyorker.com"
    , review = "Steven Graham"
    , schedule = "2016-10-07"
    , recipients = ["sgraham1v@posterous.com"]
    }
  , { name = "Thoughtbeat"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-05-12" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 69</p>"
    , query = "lgray1w@wikimedia.org"
    , review = "Laura Gray"
    , schedule = "2016-06-09"
    , recipients = ["lgray1w@state.gov"]
    }
  , { name = "Rhynyx"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-26" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 70</p>"
    , query = "dnelson1x@addthis.com"
    , review = "Denise Nelson"
    , schedule = "2016-06-14"
    , recipients = ["dnelson1x@jimdo.com"]
    }
  , { name = "Npath"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-27" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 71</p>"
    , query = "rmartin1y@msn.com"
    , review = "Raymond Martin"
    , schedule = "2016-10-07"
    , recipients = ["rmartin1y@google.cn"]
    }
  , { name = "Fivebridge"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-31" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 72</p>"
    , query = "shughes1z@nymag.com"
    , review = "Susan Hughes"
    , schedule = "2016-11-09"
    , recipients = ["shughes1z@ovh.net"]
    }
  , { name = "Demivee"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-10-13" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 73</p>"
    , query = "jkim20@mozilla.com"
    , review = "Jerry Kim"
    , schedule = "2016-10-21"
    , recipients = ["jkim20@slashdot.org"]
    }
  , { name = "Eimbee"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-11-08" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 74</p>"
    , query = "hreed21@dagondesign.com"
    , review = "Helen Reed"
    , schedule = "2016-11-09"
    , recipients = ["hreed21@stanford.edu"]
    }
  , { name = "Edgeify"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-28" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 75</p>"
    , query = "sjones22@bravesites.com"
    , review = "Stephen Jones"
    , schedule = "2016-08-12"
    , recipients = ["sjones22@ycombinator.com"]
    }
  , { name = "Photobug"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-07-17" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 76</p>"
    , query = "mmurphy23@hubpages.com"
    , review = "Martha Murphy"
    , schedule = "2016-11-08"
    , recipients = ["mmurphy23@cnn.com"]
    }
  , { name = "Topdrive"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-06-17" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 77</p>"
    , query = "hthomas24@prweb.com"
    , review = "Harry Thomas"
    , schedule = "2016-07-18"
    , recipients = ["hthomas24@ycombinator.com"]
    }
  , { name = "Mynte"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-04" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 78</p>"
    , query = "klee25@yale.edu"
    , review = "Karen Lee"
    , schedule = "2016-10-16"
    , recipients = ["klee25@google.com.au"]
    }
  , { name = "Kamba"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-07-08" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 79</p>"
    , query = "ahill26@mlb.com"
    , review = "Amanda Hill"
    , schedule = "2016-07-24"
    , recipients = ["ahill26@mediafire.com"]
    }
  , { name = "Trudoo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-09-09" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 80</p>"
    , query = "wwells27@a8.net"
    , review = "Walter Wells"
    , schedule = "2016-10-07"
    , recipients = ["wwells27@seattletimes.com"]
    }
  , { name = "Cogidoo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-02-14" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 81</p>"
    , query = "sfoster28@posterous.com"
    , review = "Sara Foster"
    , schedule = "2016-08-24"
    , recipients = ["sfoster28@vistaprint.com"]
    }
  , { name = "Voomm"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-21" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 82</p>"
    , query = "rlee29@macromedia.com"
    , review = "Ralph Lee"
    , schedule = "2016-09-16"
    , recipients = ["rlee29@storify.com"]
    }
  , { name = "Fanoodle"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-11-09" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 83</p>"
    , query = "jhoward2a@trellian.com"
    , review = "Juan Howard"
    , schedule = "2016-11-10"
    , recipients = ["jhoward2a@wired.com"]
    }
  , { name = "Bubblemix"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-01-10" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 84</p>"
    , query = "lramirez2b@altervista.org"
    , review = "Larry Ramirez"
    , schedule = "2016-08-21"
    , recipients = ["lramirez2b@hatena.ne.jp"]
    }
  , { name = "Blognation"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-07-15" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 85</p>"
    , query = "jwalker2c@tiny.cc"
    , review = "Janet Walker"
    , schedule = "2016-08-01"
    , recipients = ["jwalker2c@canalblog.com"]
    }
  , { name = "Teklist"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-11" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 86</p>"
    , query = "jparker2d@blogger.com"
    , review = "Jimmy Parker"
    , schedule = "2016-09-09"
    , recipients = ["jparker2d@salon.com"]
    }
  , { name = "Fivespan"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-10-09" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 87</p>"
    , query = "lboyd2e@dailymotion.com"
    , review = "Lori Boyd"
    , schedule = "2016-10-23"
    , recipients = ["lboyd2e@ihg.com"]
    }
  , { name = "Divanoodle"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2015-11-14" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 88</p>"
    , query = "cbradley2f@etsy.com"
    , review = "Chris Bradley"
    , schedule = "2016-08-07"
    , recipients = ["cbradley2f@ebay.com"]
    }
  , { name = "Innotype"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-05-18" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 89</p>"
    , query = "jrose2g@admin.ch"
    , review = "Jeremy Rose"
    , schedule = "2016-10-04"
    , recipients = ["jrose2g@java.com"]
    }
  , { name = "Meembee"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-07-31" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 90</p>"
    , query = "lsanchez2h@hexun.com"
    , review = "Louis Sanchez"
    , schedule = "2016-09-02"
    , recipients = ["lsanchez2h@friendfeed.com"]
    }
  , { name = "Skaboo"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-08-03" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 91</p>"
    , query = "cholmes2i@taobao.com"
    , review = "Cynthia Holmes"
    , schedule = "2016-10-13"
    , recipients = ["cholmes2i@scribd.com"]
    }
  , { name = "Meevee"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-02-22" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 92</p>"
    , query = "lrose2j@vinaora.com"
    , review = "Lawrence Rose"
    , schedule = "2016-08-24"
    , recipients = ["lrose2j@google.co.uk"]
    }
  , { name = "Oyondu"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-05-07" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 93</p>"
    , query = "jporter2k@instagram.com"
    , review = "Jessica Porter"
    , schedule = "2016-06-03"
    , recipients = ["jporter2k@scientificamerican.com"]
    }
  , { name = "Skipfire"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2015-11-25" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 94</p>"
    , query = "pcoleman2l@networksolutions.com"
    , review = "Patrick Coleman"
    , schedule = "2015-12-28"
    , recipients = ["pcoleman2l@answers.com"]
    }
  , { name = "Eayo"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-01-16" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 95</p>"
    , query = "jbryant2m@pcworld.com"
    , review = "Joseph Bryant"
    , schedule = "2016-10-06"
    , recipients = ["jbryant2m@blogtalkradio.com"]
    }
  , { name = "Geba"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-07-07" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 96</p>"
    , query = "cferguson2n@oakley.com"
    , review = "Carolyn Ferguson"
    , schedule = "2016-10-03"
    , recipients = ["cferguson2n@elpais.com"]
    }
  , { name = "Voonyx"
    , uuid = Nothing
    , locked = False
    , lastEdited = Date.fromIsoString "2016-09-19" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 97</p>"
    , query = "rrussell2o@sitemeter.com"
    , review = "Ronald Russell"
    , schedule = "2016-10-14"
    , recipients = ["rrussell2o@theglobeandmail.com"]
    }
  , { name = "Skyba"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-03-06" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 98</p>"
    , query = "bmoore2p@ucla.edu"
    , review = "Brian Moore"
    , schedule = "2016-04-13"
    , recipients = ["bmoore2p@dagondesign.com"]
    }
  , { name = "Realcube"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-01-08" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 99</p>"
    , query = "hgreene2q@quantcast.com"
    , review = "Helen Greene"
    , schedule = "2016-05-06"
    , recipients = ["hgreene2q@wikia.com"]
    }
  , { name = "Jabberbean"
    , uuid = Nothing
    , locked = True
    , lastEdited = Date.fromIsoString "2016-08-04" |> Maybe.withDefault (Date.fromTime 0)
    , template = "<p>Mock Data: 100</p>"
    , query = "amontgomery2r@uiuc.edu"
    , review = "Aaron Montgomery"
    , schedule = "2016-10-13"
    , recipients = ["amontgomery2r@umn.edu"]
    }
  ]