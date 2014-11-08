What is BetterSpaceNYC?
==

BetterSpaceNYC allows NYC residents to see which areas suck and which areas don't.
With a simple search of the map you can find out which spots in NYC have the most
or least complaints submitted to NYC's Department of Buildings.

Make sure to only search in NYC, as the complaints only pertain to the city and its boroughs.
 
Complaints range from Illegal Animal's Sold to Elevator's Being out.  All complaints
on the site are currently active and open with the Department of Buildings.

The complaints are bunched together in pretty colors with numbers inside of them.
 If you click on the pretty colors the map
will zoom in closer to give you a more specific view!  Ohhhhh.

You can locate the site [by clicking here](http://198.199.83.225/)

Developers
--
If you'd like access to the BetterSpace API you can access all 50,000+ active complaints
by hitting:

- /api/v1/complaints.json

with a simple GET request.  That will give you all the complaint
street addresses, complaint types, and complaint ID's.

If you'd like access more information for a specific complaint you can sign into the site
with GitHub, click the [developer's link](http://198.199.83.225/api_keys), and get yourself
a fancy new API Key Token doober. An API Key token doober gets you access to all this data for an individual complaint:

- created_date
- closed_date
- agency
- agency_name
- complaint_type
- descriptor
- location_type
- zip
- address
- street_name
- address_type
- city
- status
- borough
- lat
- long
- location


The API for an individual complaint can be accessed by GETting:

- api/v1/complaints/"specific_complaint_id".json

AND passing in your API token in the Header
thusly:

- Authorization Token token=Y0uR-sUp3R-sW337-t0k3N

Make sure there are NO spaces between the equal sign and the token or you'll get
bounced out very much unlike a boss.  

Enjoy!
==
