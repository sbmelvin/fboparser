--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: naics; Type: TABLE; Schema: public; Owner: stephen
--

CREATE TABLE naics (
    id bigint NOT NULL,
    code text NOT NULL,
    code_desc text NOT NULL
);


ALTER TABLE naics OWNER TO stephen;

--
-- Name: naics_id_seq; Type: SEQUENCE; Schema: public; Owner: stephen
--

CREATE SEQUENCE naics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE naics_id_seq OWNER TO stephen;

--
-- Name: naics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stephen
--

ALTER SEQUENCE naics_id_seq OWNED BY naics.id;


--
-- Name: naics id; Type: DEFAULT; Schema: public; Owner: stephen
--

ALTER TABLE ONLY naics ALTER COLUMN id SET DEFAULT nextval('naics_id_seq'::regclass);


--
-- Data for Name: naics; Type: TABLE DATA; Schema: public; Owner: stephen
--

COPY naics (id, code, code_desc) FROM stdin;
1	11	Agriculture, Forestry, Fishing and Hunting
2	111	Crop Production
3	1111	Oilseed and Grain Farming
4	11111	Soybean Farming
5	111110	Soybean Farming
6	11112	Oilseed (except Soybean) Farming
7	111120	Oilseed (except Soybean) Farming 
8	11113	Dry Pea and Bean Farming
9	111130	Dry Pea and Bean Farming 
10	11114	Wheat Farming
11	111140	Wheat Farming
12	11115	Corn Farming
13	111150	Corn Farming 
14	11116	Rice Farming
15	111160	Rice Farming
16	11119	Other Grain Farming
17	111191	Oilseed and Grain Combination Farming 
18	111199	All Other Grain Farming 
19	1112	Vegetable and Melon Farming
20	11121	Vegetable and Melon Farming
21	111211	Potato Farming 
22	111219	Other Vegetable (except Potato) and Melon Farming 
23	1113	Fruit and Tree Nut Farming
24	11131	Orange Groves
25	111310	Orange Groves
26	11132	Citrus (except Orange) Groves
27	111320	Citrus (except Orange) Groves 
28	11133	Noncitrus Fruit and Tree Nut Farming
29	111331	Apple Orchards 
30	111332	Grape Vineyards 
31	111333	Strawberry Farming 
32	111334	Berry (except Strawberry) Farming 
33	111335	Tree Nut Farming 
34	111336	Fruit and Tree Nut Combination Farming 
35	111339	Other Noncitrus Fruit Farming 
36	1114	Greenhouse, Nursery, and Floriculture Production
37	11141	Food Crops Grown Under Cover
38	111411	Mushroom Production 
39	111419	Other Food Crops Grown Under Cover 
40	11142	Nursery and Floriculture Production
41	111421	Nursery and Tree Production 
42	111422	Floriculture Production 
43	1119	Other Crop Farming
44	11191	Tobacco Farming
45	111910	Tobacco Farming
46	11192	Cotton Farming
47	111920	Cotton Farming
48	11193	Sugarcane Farming
49	111930	Sugarcane Farming
50	11194	Hay Farming
51	111940	Hay Farming 
52	11199	All Other Crop Farming
53	111991	Sugar Beet Farming 
54	111992	Peanut Farming 
55	111998	All Other Miscellaneous Crop Farming 
56	112	Animal Production and Aquaculture
57	1121	Cattle Ranching and Farming
58	11211	Beef Cattle Ranching and Farming, including Feedlots
59	112111	Beef Cattle Ranching and Farming 
60	112112	Cattle Feedlots 
61	11212	Dairy Cattle and Milk Production
62	112120	Dairy Cattle and Milk Production
63	11213	Dual-Purpose Cattle Ranching and Farming
64	112130	Dual-Purpose Cattle Ranching and Farming 
65	1122	Hog and Pig Farming
66	11221	Hog and Pig Farming
67	112210	Hog and Pig Farming 
68	1123	Poultry and Egg Production
69	11231	Chicken Egg Production
70	112310	Chicken Egg Production 
71	11232	Broilers and Other Meat Type Chicken Production
72	112320	Broilers and Other Meat Type Chicken Production 
73	11233	Turkey Production
74	112330	Turkey Production
75	11234	Poultry Hatcheries
76	112340	Poultry Hatcheries
77	11239	Other Poultry Production
78	112390	Other Poultry Production 
79	1124	Sheep and Goat Farming
80	11241	Sheep Farming
81	112410	Sheep Farming
82	11242	Goat Farming
83	112420	Goat Farming
84	1125	Aquaculture
85	11251	Aquaculture
86	112511	Finfish Farming and Fish Hatcheries 
87	112512	Shellfish Farming 
88	112519	Other Aquaculture 
89	1129	Other Animal Production
90	11291	Apiculture
91	112910	Apiculture
92	11292	Horses and Other Equine Production
93	112920	Horses and Other Equine Production
94	11293	Fur-Bearing Animal and Rabbit Production
95	112930	Fur-Bearing Animal and Rabbit Production
96	11299	All Other Animal Production
97	112990	All Other Animal Production 
98	113	Forestry and Logging
99	1131	Timber Tract Operations
100	11311	Timber Tract Operations
101	113110	Timber Tract Operations
102	1132	Forest Nurseries and Gathering of Forest Products
103	11321	Forest Nurseries and Gathering of Forest Products
104	113210	Forest Nurseries and Gathering of Forest Products 
105	1133	Logging
106	11331	Logging
107	113310	Logging 
108	114	Fishing, Hunting and Trapping
109	1141	Fishing
110	11411	Fishing
111	114111	Finfish Fishing 
112	114112	Shellfish Fishing 
113	114119	Other Marine Fishing 
114	1142	Hunting and Trapping
115	11421	Hunting and Trapping
116	114210	Hunting and Trapping
117	115	Support Activities for Agriculture and Forestry
118	1151	Support Activities for Crop Production
119	11511	Support Activities for Crop Production
120	115111	Cotton Ginning 
121	115112	Soil Preparation, Planting, and Cultivating 
122	115113	Crop Harvesting, Primarily by Machine 
123	115114	Postharvest Crop Activities (except Cotton Ginning) 
124	115115	Farm Labor Contractors and Crew Leaders 
125	115116	Farm Management Services 
126	1152	Support Activities for Animal Production
127	11521	Support Activities for Animal Production
128	115210	Support Activities for Animal Production
129	1153	Support Activities for Forestry
130	11531	Support Activities for Forestry
131	115310	Support Activities for Forestry
132	21	Mining, Quarrying, and Oil and Gas Extraction
133	211	Oil and Gas Extraction
134	2111	Oil and Gas Extraction
135	21112	Crude Petroleum Extraction 
136	211120	Crude Petroleum Extraction 
137	21113	Natural Gas Extraction 
138	211130	Natural Gas Extraction 
139	212	Mining (except Oil and Gas)
140	2121	Coal Mining
141	21211	Coal Mining
142	212111	Bituminous Coal and Lignite Surface Mining 
143	212112	Bituminous Coal Underground Mining 
144	212113	Anthracite Mining 
145	2122	Metal Ore Mining
146	21221	Iron Ore Mining
147	212210	Iron Ore Mining
148	21222	Gold Ore and Silver Ore Mining
149	212221	Gold Ore Mining 
150	212222	Silver Ore Mining 
151	21223	Copper, Nickel, Lead, and Zinc Mining
152	212230	Copper, Nickel, Lead, and Zinc Mining 
153	21229	Other Metal Ore Mining
154	212291	Uranium-Radium-Vanadium Ore Mining 
155	212299	All Other Metal Ore Mining 
156	2123	Nonmetallic Mineral Mining and Quarrying
157	21231	Stone Mining and Quarrying
158	212311	Dimension Stone Mining and Quarrying 
159	212312	Crushed and Broken Limestone Mining and Quarrying 
160	212313	Crushed and Broken Granite Mining and Quarrying 
161	212319	Other Crushed and Broken Stone Mining and Quarrying 
162	21232	Sand, Gravel, Clay, and Ceramic and Refractory Minerals Mining and Quarrying
163	212321	Construction Sand and Gravel Mining 
164	212322	Industrial Sand Mining 
165	212324	Kaolin and Ball Clay Mining 
166	212325	Clay and Ceramic and Refractory Minerals Mining 
167	21239	Other Nonmetallic Mineral Mining and Quarrying
168	212391	Potash, Soda, and Borate Mineral Mining 
169	212392	Phosphate Rock Mining 
170	212393	Other Chemical and Fertilizer Mineral Mining 
171	212399	All Other Nonmetallic Mineral Mining 
172	213	Support Activities for Mining
173	2131	Support Activities for Mining
174	21311	Support Activities for Mining
175	213111	Drilling Oil and Gas Wells
176	213112	Support Activities for Oil and Gas Operations 
177	213113	Support Activities for Coal Mining 
178	213114	Support Activities for Metal Mining 
179	213115	Support Activities for Nonmetallic Minerals (except Fuels) Mining 
180	22	Utilities
181	221	Utilities 
182	2211	Electric Power Generation, Transmission and Distribution
183	22111	Electric Power Generation 
184	221111	Hydroelectric Power Generation 
185	221112	Fossil Fuel Electric Power Generation 
186	221113	Nuclear Electric Power Generation 
187	221114	Solar Electric Power Generation 
188	221115	Wind Electric Power Generation 
189	221116	Geothermal Electric Power Generation 
190	221117	Biomass Electric Power Generation 
191	221118	Other Electric Power Generation 
192	22112	Electric Power Transmission, Control, and Distribution 
193	221121	Electric Bulk Power Transmission and Control 
194	221122	Electric Power Distribution 
195	2212	Natural Gas Distribution 
196	22121	Natural Gas Distribution 
197	221210	Natural Gas Distribution 
198	2213	Water, Sewage and Other Systems 
199	22131	Water Supply and Irrigation Systems 
200	221310	Water Supply and Irrigation Systems 
201	22132	Sewage Treatment Facilities 
202	221320	Sewage Treatment Facilities 
203	22133	Steam and Air-Conditioning Supply 
204	221330	Steam and Air-Conditioning Supply 
205	23	Construction
206	236	Construction of Buildings
207	2361	Residential Building Construction
208	23611	Residential Building Construction
209	236115	New Single-Family Housing Construction (except For-Sale Builders) 
210	236116	New Multifamily Housing Construction (except For-Sale Builders) 
211	236117	New Housing For-Sale Builders 
212	236118	Residential Remodelers 
213	2362	Nonresidential Building Construction
214	23621	Industrial Building Construction
215	236210	Industrial Building Construction 
216	23622	Commercial and Institutional Building Construction
217	236220	Commercial and Institutional Building Construction 
420	3162	Footwear Manufacturing
218	237	Heavy and Civil Engineering Construction
219	2371	Utility System Construction
220	23711	Water and Sewer Line and Related Structures Construction
221	237110	Water and Sewer Line and Related Structures Construction 
222	23712	Oil and Gas Pipeline and Related Structures Construction
223	237120	Oil and Gas Pipeline and Related Structures Construction 
224	23713	Power and Communication Line and Related Structures Construction
225	237130	Power and Communication Line and Related Structures Construction 
226	2372	Land Subdivision
227	23721	Land Subdivision
228	237210	Land Subdivision 
229	2373	Highway, Street, and Bridge Construction
230	23731	Highway, Street, and Bridge Construction
231	237310	Highway, Street, and Bridge Construction 
232	2379	Other Heavy and Civil Engineering Construction
233	23799	Other Heavy and Civil Engineering Construction
234	237990	Other Heavy and Civil Engineering Construction 
235	238	Specialty Trade Contractors
236	2381	Foundation, Structure, and Building Exterior Contractors
237	23811	Poured Concrete Foundation and Structure Contractors 
238	238110	Poured Concrete Foundation and Structure Contractors 
239	23812	Structural Steel and Precast Concrete Contractors 
240	238120	Structural Steel and Precast Concrete Contractors 
241	23813	Framing Contractors 
242	238130	Framing Contractors 
243	23814	Masonry Contractors 
244	238140	Masonry Contractors 
245	23815	Glass and Glazing Contractors 
246	238150	Glass and Glazing Contractors 
247	23816	Roofing Contractors 
248	238160	Roofing Contractors 
249	23817	Siding Contractors 
250	238170	Siding Contractors 
251	23819	Other Foundation, Structure, and Building Exterior Contractors 
252	238190	Other Foundation, Structure, and Building Exterior Contractors 
253	2382	Building Equipment Contractors
254	23821	Electrical Contractors and Other Wiring Installation Contractors
255	238210	Electrical Contractors and Other Wiring Installation Contractors
256	23822	Plumbing, Heating, and Air-Conditioning Contractors
257	238220	Plumbing, Heating, and Air-Conditioning Contractors 
258	23829	Other Building Equipment Contractors
259	238290	Other Building Equipment Contractors 
260	2383	Building Finishing Contractors
261	23831	Drywall and Insulation Contractors
262	238310	Drywall and Insulation Contractors 
263	23832	Painting and Wall Covering Contractors
264	238320	Painting and Wall Covering Contractors
265	23833	Flooring Contractors
266	238330	Flooring Contractors
267	23834	Tile and Terrazzo Contractors
268	238340	Tile and Terrazzo Contractors
269	23835	Finish Carpentry Contractors
270	238350	Finish Carpentry Contractors
271	23839	Other Building Finishing Contractors
272	238390	Other Building Finishing Contractors
273	2389	Other Specialty Trade Contractors
274	23891	Site Preparation Contractors
275	238910	Site Preparation Contractors
276	23899	All Other Specialty Trade Contractors
277	238990	All Other Specialty Trade Contractors
278	31-33	Manufacturing
279	311	Food Manufacturing
280	3111	Animal Food Manufacturing
281	31111	Animal Food Manufacturing
282	311111	Dog and Cat Food Manufacturing 
283	311119	Other Animal Food Manufacturing 
284	3112	Grain and Oilseed Milling
285	31121	Flour Milling and Malt Manufacturing
286	311211	Flour Milling 
287	311212	Rice Milling 
288	311213	Malt Manufacturing 
289	31122	Starch and Vegetable Fats and Oils Manufacturing
290	311221	Wet Corn Milling 
291	311224	Soybean and Other Oilseed Processing 
292	311225	Fats and Oils Refining and Blending 
293	31123	Breakfast Cereal Manufacturing
294	311230	Breakfast Cereal Manufacturing
295	3113	Sugar and Confectionery Product Manufacturing
296	31131	Sugar Manufacturing
297	311313	Beet Sugar Manufacturing 
298	311314	Cane Sugar Manufacturing 
299	31134	Nonchocolate Confectionery Manufacturing
300	311340	Nonchocolate Confectionery Manufacturing
301	31135	Chocolate and Confectionery Manufacturing
302	311351	Chocolate and Confectionery Manufacturing from Cacao Beans 
303	311352	Confectionery Manufacturing from Purchased Chocolate 
304	3114	Fruit and Vegetable Preserving and Specialty Food Manufacturing
305	31141	Frozen Food Manufacturing
306	311411	Frozen Fruit, Juice, and Vegetable Manufacturing 
307	311412	Frozen Specialty Food Manufacturing 
308	31142	Fruit and Vegetable Canning, Pickling, and Drying
309	311421	Fruit and Vegetable Canning 
310	311422	Specialty Canning 
311	311423	Dried and Dehydrated Food Manufacturing 
312	3115	Dairy Product Manufacturing
313	31151	Dairy Product (except Frozen) Manufacturing
314	311511	Fluid Milk Manufacturing 
315	311512	Creamery Butter Manufacturing 
316	311513	Cheese Manufacturing 
317	311514	Dry, Condensed, and Evaporated Dairy Product Manufacturing 
318	31152	Ice Cream and Frozen Dessert Manufacturing
319	311520	Ice Cream and Frozen Dessert Manufacturing
320	3116	Animal Slaughtering and Processing
321	31161	Animal Slaughtering and Processing
322	311611	Animal (except Poultry) Slaughtering 
323	311612	Meat Processed from Carcasses 
324	311613	Rendering and Meat Byproduct Processing 
325	311615	Poultry Processing 
326	3117	Seafood Product Preparation and Packaging
327	31171	Seafood Product Preparation and Packaging
328	311710	Seafood Product Preparation and Packaging
329	3118	Bakeries and Tortilla Manufacturing
330	31181	Bread and Bakery Product Manufacturing
331	311811	Retail Bakeries 
332	311812	Commercial Bakeries 
333	311813	Frozen Cakes, Pies, and Other Pastries Manufacturing 
334	31182	Cookie, Cracker, and Pasta Manufacturing
335	311821	Cookie and Cracker Manufacturing 
336	311824	Dry Pasta, Dough, and Flour Mixes Manufacturing from Purchased Flour 
337	31183	Tortilla Manufacturing
338	311830	Tortilla Manufacturing
339	3119	Other Food Manufacturing
340	31191	Snack Food Manufacturing
341	311911	Roasted Nuts and Peanut Butter Manufacturing 
342	311919	Other Snack Food Manufacturing 
343	31192	Coffee and Tea Manufacturing
344	311920	Coffee and Tea Manufacturing 
345	31193	Flavoring Syrup and Concentrate Manufacturing
346	311930	Flavoring Syrup and Concentrate Manufacturing
347	31194	Seasoning and Dressing Manufacturing
348	311941	Mayonnaise, Dressing, and Other Prepared Sauce Manufacturing 
349	311942	Spice and Extract Manufacturing 
350	31199	All Other Food Manufacturing
351	311991	Perishable Prepared Food Manufacturing 
352	311999	All Other Miscellaneous Food Manufacturing 
353	312	Beverage and Tobacco Product Manufacturing
354	3121	Beverage Manufacturing
355	31211	Soft Drink and Ice Manufacturing
356	312111	Soft Drink Manufacturing 
357	312112	Bottled Water Manufacturing 
358	312113	Ice Manufacturing 
359	31212	Breweries
360	312120	Breweries
361	31213	Wineries
362	312130	Wineries 
363	31214	Distilleries
364	312140	Distilleries 
365	3122	Tobacco Manufacturing
366	31223	Tobacco Manufacturing
367	312230	Tobacco Manufacturing 
368	313	Textile Mills
369	3131	Fiber, Yarn, and Thread Mills
370	31311	Fiber, Yarn, and Thread Mills
371	313110	Fiber, Yarn, and Thread Mills 
372	3132	Fabric Mills
373	31321	Broadwoven Fabric Mills
374	313210	Broadwoven Fabric Mills
375	31322	Narrow Fabric Mills and Schiffli Machine Embroidery
376	313220	Narrow Fabric Mills and Schiffli Machine Embroidery
377	31323	Nonwoven Fabric Mills
378	313230	Nonwoven Fabric Mills
379	31324	Knit Fabric Mills
380	313240	Knit Fabric Mills
381	3133	Textile and Fabric Finishing and Fabric Coating Mills
382	31331	Textile and Fabric Finishing Mills
383	313310	Textile and Fabric Finishing Mills 
384	31332	Fabric Coating Mills
385	313320	Fabric Coating Mills
386	314	Textile Product Mills
387	3141	Textile Furnishings Mills
388	31411	Carpet and Rug Mills
389	314110	Carpet and Rug Mills
390	31412	Curtain and Linen Mills
391	314120	Curtain and Linen Mills
392	3149	Other Textile Product Mills
393	31491	Textile Bag and Canvas Mills
394	314910	Textile Bag and Canvas Mills 
395	31499	All Other Textile Product Mills
396	314994	Rope, Cordage, Twine, Tire Cord, and Tire Fabric Mills 
397	314999	All Other Miscellaneous Textile Product Mills 
398	315	Apparel Manufacturing
399	3151	Apparel Knitting Mills
400	31511	Hosiery and Sock Mills
401	315110	Hosiery and Sock Mills
402	31519	Other Apparel Knitting Mills
403	315190	Other Apparel Knitting Mills 
404	3152	Cut and Sew Apparel Manufacturing
405	31521	Cut and Sew Apparel Contractors 
406	315210	Cut and Sew Apparel Contractors 
407	31522	Men’s and Boys’ Cut and Sew Apparel Manufacturing 
408	315220	Men’s and Boys’ Cut and Sew Apparel Manufacturing 
409	31524	Women’s, Girls’, and Infants’ Cut and Sew Apparel Manufacturing
410	315240	Women’s, Girls’, and Infants’ Cut and Sew Apparel Manufacturing 
411	31528	Other Cut and Sew Apparel Manufacturing 
412	315280	Other Cut and Sew Apparel Manufacturing 
413	3159	Apparel Accessories and Other Apparel Manufacturing
414	31599	Apparel Accessories and Other Apparel Manufacturing
415	315990	Apparel Accessories and Other Apparel Manufacturing 
416	316	Leather and Allied Product Manufacturing
417	3161	Leather and Hide Tanning and Finishing
418	31611	Leather and Hide Tanning and Finishing
419	316110	Leather and Hide Tanning and Finishing
421	31621	Footwear Manufacturing
422	316210	Footwear Manufacturing 
423	3169	Other Leather and Allied Product Manufacturing
424	31699	Other Leather and Allied Product Manufacturing
425	316992	Women's Handbag and Purse Manufacturing 
426	316998	All Other Leather Good and Allied Product Manufacturing 
427	321	Wood Product Manufacturing
428	3211	Sawmills and Wood Preservation
429	32111	Sawmills and Wood Preservation
430	321113	Sawmills 
431	321114	Wood Preservation 
432	3212	Veneer, Plywood, and Engineered Wood Product Manufacturing
433	32121	Veneer, Plywood, and Engineered Wood Product Manufacturing
434	321211	Hardwood Veneer and Plywood Manufacturing 
435	321212	Softwood Veneer and Plywood Manufacturing 
436	321213	Engineered Wood Member (except Truss) Manufacturing 
437	321214	Truss Manufacturing 
438	321219	Reconstituted Wood Product Manufacturing 
439	3219	Other Wood Product Manufacturing
440	32191	Millwork
441	321911	Wood Window and Door Manufacturing 
442	321912	Cut Stock, Resawing Lumber, and Planing 
443	321918	Other Millwork (including Flooring) 
444	32192	Wood Container and Pallet Manufacturing
445	321920	Wood Container and Pallet Manufacturing
446	32199	All Other Wood Product Manufacturing
447	321991	Manufactured Home (Mobile Home) Manufacturing 
448	321992	Prefabricated Wood Building Manufacturing 
449	321999	All Other Miscellaneous Wood Product Manufacturing 
450	322	Paper Manufacturing
451	3221	Pulp, Paper, and Paperboard Mills
452	32211	Pulp Mills
453	322110	Pulp Mills 
454	32212	Paper Mills
455	322121	Paper (except Newsprint) Mills 
456	322122	Newsprint Mills 
457	32213	Paperboard Mills
458	322130	Paperboard Mills 
459	3222	Converted Paper Product Manufacturing
460	32221	Paperboard Container Manufacturing
461	322211	Corrugated and Solid Fiber Box Manufacturing 
462	322212	Folding Paperboard Box Manufacturing 
463	322219	Other Paperboard Container Manufacturing 
464	32222	Paper Bag and Coated and Treated Paper Manufacturing
465	322220	Paper Bag and Coated and Treated Paper Manufacturing
466	32223	Stationery Product Manufacturing
467	322230	Stationery Product Manufacturing
468	32229	Other Converted Paper Product Manufacturing
469	322291	Sanitary Paper Product Manufacturing 
470	322299	All Other Converted Paper Product Manufacturing 
471	323	Printing and Related Support Activities
472	3231	Printing and Related Support Activities
473	32311	Printing
474	323111	Commercial Printing (except Screen and Books) 
475	323113	Commercial Screen Printing 
476	323117	Books Printing 
477	32312	Support Activities for Printing
478	323120	Support Activities for Printing
479	324	Petroleum and Coal Products Manufacturing
480	3241	Petroleum and Coal Products Manufacturing
481	32411	Petroleum Refineries
482	324110	Petroleum Refineries
483	32412	Asphalt Paving, Roofing, and Saturated Materials Manufacturing
484	324121	Asphalt Paving Mixture and Block Manufacturing 
485	324122	Asphalt Shingle and Coating Materials Manufacturing 
486	32419	Other Petroleum and Coal Products Manufacturing
487	324191	Petroleum Lubricating Oil and Grease Manufacturing 
488	324199	All Other Petroleum and Coal Products Manufacturing 
489	325	Chemical Manufacturing
490	3251	Basic Chemical Manufacturing
491	32511	Petrochemical Manufacturing
492	325110	Petrochemical Manufacturing
493	32512	Industrial Gas Manufacturing
494	325120	Industrial Gas Manufacturing
495	32513	Synthetic Dye and Pigment Manufacturing
496	325130	Synthetic Dye and Pigment Manufacturing
497	32518	Other Basic Inorganic Chemical Manufacturing
498	325180	Other Basic Inorganic Chemical Manufacturing 
499	32519	Other Basic Organic Chemical Manufacturing
500	325193	Ethyl Alcohol Manufacturing 
501	325194	Cyclic Crude, Intermediate, and Gum and Wood Chemical Manufacturing 
502	325199	All Other Basic Organic Chemical Manufacturing 
503	3252	Resin, Synthetic Rubber, and Artificial and Synthetic Fibers and Filaments Manufacturing
504	32521	Resin and Synthetic Rubber Manufacturing
505	325211	Plastics Material and Resin Manufacturing 
506	325212	Synthetic Rubber Manufacturing 
507	32522	Artificial and Synthetic Fibers and Filaments Manufacturing
508	325220	Artificial and Synthetic Fibers and Filaments Manufacturing
509	3253	Pesticide, Fertilizer, and Other Agricultural Chemical Manufacturing
510	32531	Fertilizer Manufacturing
511	325311	Nitrogenous Fertilizer Manufacturing 
512	325312	Phosphatic Fertilizer Manufacturing 
513	325314	Fertilizer (Mixing Only) Manufacturing 
514	32532	Pesticide and Other Agricultural Chemical Manufacturing
515	325320	Pesticide and Other Agricultural Chemical Manufacturing
516	3254	Pharmaceutical and Medicine Manufacturing
517	32541	Pharmaceutical and Medicine Manufacturing
518	325411	Medicinal and Botanical Manufacturing 
519	325412	Pharmaceutical Preparation Manufacturing 
520	325413	In-Vitro Diagnostic Substance Manufacturing 
521	325414	Biological Product (except Diagnostic) Manufacturing 
522	3255	Paint, Coating, and Adhesive Manufacturing
523	32551	Paint and Coating Manufacturing
524	325510	Paint and Coating Manufacturing
525	32552	Adhesive Manufacturing
526	325520	Adhesive Manufacturing
527	3256	Soap, Cleaning Compound, and Toilet Preparation Manufacturing
528	32561	Soap and Cleaning Compound Manufacturing
529	325611	Soap and Other Detergent Manufacturing 
530	325612	Polish and Other Sanitation Good Manufacturing 
531	325613	Surface Active Agent Manufacturing 
532	32562	Toilet Preparation Manufacturing
533	325620	Toilet Preparation Manufacturing
534	3259	Other Chemical Product and Preparation Manufacturing
535	32591	Printing Ink Manufacturing
536	325910	Printing Ink Manufacturing
537	32592	Explosives Manufacturing
538	325920	Explosives Manufacturing
539	32599	All Other Chemical Product and Preparation Manufacturing
540	325991	Custom Compounding of Purchased Resins 
541	325992	Photographic Film, Paper, Plate, and Chemical Manufacturing 
542	325998	All Other Miscellaneous Chemical Product and Preparation Manufacturing 
543	326	Plastics and Rubber Products Manufacturing
544	3261	Plastics Product Manufacturing
545	32611	Plastics Packaging Materials and Unlaminated Film and Sheet Manufacturing
546	326111	Plastics Bag and Pouch Manufacturing 
547	326112	Plastics Packaging Film and Sheet (including Laminated) Manufacturing 
548	326113	Unlaminated Plastics Film and Sheet (except Packaging) Manufacturing 
549	32612	Plastics Pipe, Pipe Fitting, and Unlaminated Profile Shape Manufacturing
550	326121	Unlaminated Plastics Profile Shape Manufacturing 
551	326122	Plastics Pipe and Pipe Fitting Manufacturing 
552	32613	Laminated Plastics Plate, Sheet (except Packaging), and Shape Manufacturing
553	326130	Laminated Plastics Plate, Sheet (except Packaging), and Shape Manufacturing
554	32614	Polystyrene Foam Product Manufacturing
555	326140	Polystyrene Foam Product Manufacturing
556	32615	Urethane and Other Foam Product (except Polystyrene) Manufacturing
557	326150	Urethane and Other Foam Product (except Polystyrene) Manufacturing
558	32616	Plastics Bottle Manufacturing
559	326160	Plastics Bottle Manufacturing
560	32619	Other Plastics Product Manufacturing
561	326191	Plastics Plumbing Fixture Manufacturing 
562	326199	All Other Plastics Product Manufacturing 
563	3262	Rubber Product Manufacturing
564	32621	Tire Manufacturing
565	326211	Tire Manufacturing (except Retreading) 
566	326212	Tire Retreading 
567	32622	Rubber and Plastics Hoses and Belting Manufacturing
568	326220	Rubber and Plastics Hoses and Belting Manufacturing
569	32629	Other Rubber Product Manufacturing
570	326291	Rubber Product Manufacturing for Mechanical Use 
571	326299	All Other Rubber Product Manufacturing 
572	327	Nonmetallic Mineral Product Manufacturing
573	3271	Clay Product and Refractory Manufacturing
574	32711	Pottery, Ceramics, and Plumbing Fixture Manufacturing
575	327110	Pottery, Ceramics, and Plumbing Fixture Manufacturing 
576	32712	Clay Building Material and Refractories Manufacturing
577	327120	Clay Building Material and Refractories Manufacturing 
578	3272	Glass and Glass Product Manufacturing
579	32721	Glass and Glass Product Manufacturing
580	327211	Flat Glass Manufacturing 
581	327212	Other Pressed and Blown Glass and Glassware Manufacturing 
582	327213	Glass Container Manufacturing 
583	327215	Glass Product Manufacturing Made of Purchased Glass 
584	3273	Cement and Concrete Product Manufacturing
585	32731	Cement Manufacturing
586	327310	Cement Manufacturing
587	32732	Ready-Mix Concrete Manufacturing
588	327320	Ready-Mix Concrete Manufacturing
589	32733	Concrete Pipe, Brick, and Block Manufacturing
590	327331	Concrete Block and Brick Manufacturing 
591	327332	Concrete Pipe Manufacturing 
592	32739	Other Concrete Product Manufacturing
593	327390	Other Concrete Product Manufacturing 
594	3274	Lime and Gypsum Product Manufacturing
595	32741	Lime Manufacturing
596	327410	Lime Manufacturing
597	32742	Gypsum Product Manufacturing
598	327420	Gypsum Product Manufacturing
599	3279	Other Nonmetallic Mineral Product Manufacturing
600	32791	Abrasive Product Manufacturing
601	327910	Abrasive Product Manufacturing
602	32799	All Other Nonmetallic Mineral Product Manufacturing
603	327991	Cut Stone and Stone Product Manufacturing 
604	327992	Ground or Treated Mineral and Earth Manufacturing 
605	327993	Mineral Wool Manufacturing 
606	327999	All Other Miscellaneous Nonmetallic Mineral Product Manufacturing 
607	331	Primary Metal Manufacturing
608	3311	Iron and Steel Mills and Ferroalloy Manufacturing
609	33111	Iron and Steel Mills and Ferroalloy Manufacturing
1126	44411	Home Centers 
610	331110	Iron and Steel Mills and Ferroalloy Manufacturing 
611	3312	Steel Product Manufacturing from Purchased Steel
612	33121	Iron and Steel Pipe and Tube Manufacturing from Purchased Steel
613	331210	Iron and Steel Pipe and Tube Manufacturing from Purchased Steel
614	33122	Rolling and Drawing of Purchased Steel
615	331221	Rolled Steel Shape Manufacturing 
616	331222	Steel Wire Drawing 
617	3313	Alumina and Aluminum Production and Processing
618	33131	Alumina and Aluminum Production and Processing
619	331313	Alumina Refining and Primary Aluminum Production 
620	331314	Secondary Smelting and Alloying of Aluminum 
621	331315	Aluminum Sheet, Plate, and Foil Manufacturing 
622	331318	Other Aluminum Rolling, Drawing, and Extruding 
623	3314	Nonferrous Metal (except Aluminum) Production and Processing
624	33141	Nonferrous Metal (except Aluminum) Smelting and Refining
625	331410	Nonferrous Metal (except Aluminum) Smelting and Refining 
626	33142	Copper Rolling, Drawing, Extruding, and Alloying
627	331420	Copper Rolling, Drawing, Extruding, and Alloying
628	33149	Nonferrous Metal (except Copper and Aluminum) Rolling, Drawing, Extruding, and Alloying
629	331491	Nonferrous Metal (except Copper and Aluminum) Rolling, Drawing, and Extruding 
630	331492	Secondary Smelting, Refining, and Alloying of Nonferrous Metal (except Copper and Aluminum) 
631	3315	Foundries
632	33151	Ferrous Metal Foundries
633	331511	Iron Foundries 
634	331512	Steel Investment Foundries 
635	331513	Steel Foundries (except Investment) 
636	33152	Nonferrous Metal Foundries
637	331523	Nonferrous Metal Die-Casting Foundries 
638	331524	Aluminum Foundries (except Die-Casting) 
639	331529	Other Nonferrous Metal Foundries (except Die-Casting) 
640	332	Fabricated Metal Product Manufacturing
641	3321	Forging and Stamping
642	33211	Forging and Stamping
643	332111	Iron and Steel Forging 
644	332112	Nonferrous Forging 
645	332114	Custom Roll Forming 
646	332117	Powder Metallurgy Part Manufacturing 
647	332119	Metal Crown, Closure, and Other Metal Stamping (except Automotive) 
648	3322	Cutlery and Handtool Manufacturing
649	33221	Cutlery and Handtool Manufacturing
650	332215	Metal Kitchen Cookware, Utensil, Cutlery, and Flatware (except Precious) Manufacturing 
651	332216	Saw Blade and Handtool Manufacturing 
652	3323	Architectural and Structural Metals Manufacturing
653	33231	Plate Work and Fabricated Structural Product Manufacturing
654	332311	Prefabricated Metal Building and Component Manufacturing 
655	332312	Fabricated Structural Metal Manufacturing 
656	332313	Plate Work Manufacturing 
657	33232	Ornamental and Architectural Metal Products Manufacturing
658	332321	Metal Window and Door Manufacturing 
659	332322	Sheet Metal Work Manufacturing 
660	332323	Ornamental and Architectural Metal Work Manufacturing 
661	3324	Boiler, Tank, and Shipping Container Manufacturing
662	33241	Power Boiler and Heat Exchanger Manufacturing
663	332410	Power Boiler and Heat Exchanger Manufacturing
664	33242	Metal Tank (Heavy Gauge) Manufacturing
665	332420	Metal Tank (Heavy Gauge) Manufacturing
666	33243	Metal Can, Box, and Other Metal Container (Light Gauge) Manufacturing
667	332431	Metal Can Manufacturing 
668	332439	Other Metal Container Manufacturing 
669	3325	Hardware Manufacturing
670	33251	Hardware Manufacturing
671	332510	Hardware Manufacturing
672	3326	Spring and Wire Product Manufacturing
673	33261	Spring and Wire Product Manufacturing
674	332613	Spring Manufacturing 
675	332618	Other Fabricated Wire Product Manufacturing 
676	3327	Machine Shops; Turned Product; and Screw, Nut, and Bolt Manufacturing
677	33271	Machine Shops
678	332710	Machine Shops
679	33272	Turned Product and Screw, Nut, and Bolt Manufacturing
680	332721	Precision Turned Product Manufacturing 
681	332722	Bolt, Nut, Screw, Rivet, and Washer Manufacturing 
682	3328	Coating, Engraving, Heat Treating, and Allied Activities
683	33281	Coating, Engraving, Heat Treating, and Allied Activities
684	332811	Metal Heat Treating 
685	332812	Metal Coating, Engraving (except Jewelry and Silverware), and Allied Services to Manufacturers 
686	332813	Electroplating, Plating, Polishing, Anodizing, and Coloring 
687	3329	Other Fabricated Metal Product Manufacturing
688	33291	Metal Valve Manufacturing
689	332911	Industrial Valve Manufacturing 
690	332912	Fluid Power Valve and Hose Fitting Manufacturing 
691	332913	Plumbing Fixture Fitting and Trim Manufacturing 
692	332919	Other Metal Valve and Pipe Fitting Manufacturing 
693	33299	All Other Fabricated Metal Product Manufacturing
694	332991	Ball and Roller Bearing Manufacturing
695	332992	Small Arms Ammunition Manufacturing 
696	332993	Ammunition (except Small Arms) Manufacturing 
697	332994	Small Arms, Ordnance, and Ordnance Accessories Manufacturing 
698	332996	Fabricated Pipe and Pipe Fitting Manufacturing 
699	332999	All Other Miscellaneous Fabricated Metal Product Manufacturing 
700	333	Machinery Manufacturing
701	3331	Agriculture, Construction, and Mining Machinery Manufacturing
702	33311	Agricultural Implement Manufacturing
703	333111	Farm Machinery and Equipment Manufacturing 
704	333112	Lawn and Garden Tractor and Home Lawn and Garden Equipment Manufacturing 
705	33312	Construction Machinery Manufacturing
706	333120	Construction Machinery Manufacturing
707	33313	Mining and Oil and Gas Field Machinery Manufacturing
708	333131	Mining Machinery and Equipment Manufacturing 
709	333132	Oil and Gas Field Machinery and Equipment Manufacturing 
710	3332	Industrial Machinery Manufacturing
711	33324	Industrial Machinery Manufacturing
712	333241	Food Product Machinery Manufacturing 
713	333242	Semiconductor Machinery Manufacturing 
714	333243	Sawmill, Woodworking, and Paper Machinery Manufacturing 
715	333244	Printing Machinery and Equipment Manufacturing 
716	333249	Other Industrial Machinery Manufacturing 
717	3333	Commercial and Service Industry Machinery Manufacturing
718	33331	Commercial and Service Industry Machinery Manufacturing
719	333314	Optical Instrument and Lens Manufacturing 
720	333316	Photographic and Photocopying Equipment Manufacturing 
721	333318	Other Commercial and Service Industry Machinery Manufacturing 
722	3334	Ventilation, Heating, Air-Conditioning, and Commercial Refrigeration Equipment Manufacturing
723	33341	Ventilation, Heating, Air-Conditioning, and Commercial Refrigeration Equipment Manufacturing
724	333413	Industrial and Commercial Fan and Blower and Air Purification Equipment Manufacturing 
725	333414	Heating Equipment (except Warm Air Furnaces) Manufacturing 
726	333415	Air-Conditioning and Warm Air Heating Equipment and Commercial and Industrial Refrigeration Equipment Manufacturing 
727	3335	Metalworking Machinery Manufacturing
728	33351	Metalworking Machinery Manufacturing
729	333511	Industrial Mold Manufacturing 
730	333514	Special Die and Tool, Die Set, Jig, and Fixture Manufacturing 
731	333515	Cutting Tool and Machine Tool Accessory Manufacturing 
732	333517	Machine Tool Manufacturing 
733	333519	Rolling Mill and Other Metalworking Machinery Manufacturing 
734	3336	Engine, Turbine, and Power Transmission Equipment Manufacturing
735	33361	Engine, Turbine, and Power Transmission Equipment Manufacturing
736	333611	Turbine and Turbine Generator Set Units Manufacturing 
737	333612	Speed Changer, Industrial High-Speed Drive, and Gear Manufacturing 
738	333613	Mechanical Power Transmission Equipment Manufacturing 
739	333618	Other Engine Equipment Manufacturing 
740	3339	Other General Purpose Machinery Manufacturing
741	33391	Pump and Compressor Manufacturing
742	333912	Air and Gas Compressor Manufacturing 
743	333914	Measuring, Dispensing, and Other Pumping Equipment Manufacturing 
744	33392	Material Handling Equipment Manufacturing
745	333921	Elevator and Moving Stairway Manufacturing 
746	333922	Conveyor and Conveying Equipment Manufacturing 
747	333923	Overhead Traveling Crane, Hoist, and Monorail System Manufacturing 
748	333924	Industrial Truck, Tractor, Trailer, and Stacker Machinery Manufacturing 
749	33399	All Other General Purpose Machinery Manufacturing
750	333991	Power-Driven Handtool Manufacturing 
751	333992	Welding and Soldering Equipment Manufacturing 
752	333993	Packaging Machinery Manufacturing 
753	333994	Industrial Process Furnace and Oven Manufacturing 
754	333995	Fluid Power Cylinder and Actuator Manufacturing 
755	333996	Fluid Power Pump and Motor Manufacturing 
756	333997	Scale and Balance Manufacturing 
757	333999	All Other Miscellaneous General Purpose Machinery Manufacturing 
758	334	Computer and Electronic Product Manufacturing
759	3341	Computer and Peripheral Equipment Manufacturing
760	33411	Computer and Peripheral Equipment Manufacturing
761	334111	Electronic Computer Manufacturing 
762	334112	Computer Storage Device Manufacturing 
763	334118	Computer Terminal and Other Computer Peripheral Equipment Manufacturing 
764	3342	Communications Equipment Manufacturing
765	33421	Telephone Apparatus Manufacturing
766	334210	Telephone Apparatus Manufacturing
767	33422	Radio and Television Broadcasting and Wireless Communications Equipment Manufacturing
768	334220	Radio and Television Broadcasting and Wireless Communications Equipment Manufacturing
769	33429	Other Communications Equipment Manufacturing
770	334290	Other Communications Equipment Manufacturing
771	3343	Audio and Video Equipment Manufacturing
772	33431	Audio and Video Equipment Manufacturing
773	334310	Audio and Video Equipment Manufacturing
774	3344	Semiconductor and Other Electronic Component Manufacturing
775	33441	Semiconductor and Other Electronic Component Manufacturing
776	334412	Bare Printed Circuit Board Manufacturing  
777	334413	Semiconductor and Related Device Manufacturing 
778	334416	Capacitor, Resistor, Coil, Transformer, and Other Inductor Manufacturing 
779	334417	Electronic Connector Manufacturing 
780	334418	Printed Circuit Assembly (Electronic Assembly) Manufacturing 
781	334419	Other Electronic Component Manufacturing 
782	3345	Navigational, Measuring, Electromedical, and Control Instruments Manufacturing
783	33451	Navigational, Measuring, Electromedical, and Control Instruments Manufacturing
784	334510	Electromedical and Electrotherapeutic Apparatus Manufacturing 
785	334511	Search, Detection, Navigation, Guidance, Aeronautical, and Nautical System and Instrument Manufacturing 
786	334512	Automatic Environmental Control Manufacturing for Residential, Commercial, and Appliance Use 
787	334513	Instruments and Related Products Manufacturing for Measuring, Displaying, and Controlling Industrial Process Variables 
788	334514	Totalizing Fluid Meter and Counting Device Manufacturing 
789	334515	Instrument Manufacturing for Measuring and Testing Electricity and Electrical Signals 
790	334516	Analytical Laboratory Instrument Manufacturing 
791	334517	Irradiation Apparatus Manufacturing 
792	334519	Other Measuring and Controlling Device Manufacturing 
793	3346	Manufacturing and Reproducing Magnetic and Optical Media
794	33461	Manufacturing and Reproducing Magnetic and Optical Media
795	334613	Blank Magnetic and Optical Recording Media Manufacturing 
796	334614	Software and Other Prerecorded Compact Disc, Tape, and Record Reproducing 
797	335	Electrical Equipment, Appliance, and Component Manufacturing
798	3351	Electric Lighting Equipment Manufacturing
799	33511	Electric Lamp Bulb and Part Manufacturing
800	335110	Electric Lamp Bulb and Part Manufacturing
801	33512	Lighting Fixture Manufacturing
802	335121	Residential Electric Lighting Fixture Manufacturing 
803	335122	Commercial, Industrial, and Institutional Electric Lighting Fixture Manufacturing 
804	335129	Other Lighting Equipment Manufacturing 
805	3352	Household Appliance Manufacturing
806	33521	Small Electrical Appliance Manufacturing
807	335210	Small Electrical Appliance Manufacturing
808	33522	Major Household Appliance Manufacturing 
809	335220	Major Household Appliance Manufacturing 
810	3353	Electrical Equipment Manufacturing
811	33531	Electrical Equipment Manufacturing
812	335311	Power, Distribution, and Specialty Transformer Manufacturing 
813	335312	Motor and Generator Manufacturing 
814	335313	Switchgear and Switchboard Apparatus Manufacturing 
815	335314	Relay and Industrial Control Manufacturing 
816	3359	Other Electrical Equipment and Component Manufacturing
817	33591	Battery Manufacturing
818	335911	Storage Battery Manufacturing 
819	335912	Primary Battery Manufacturing 
820	33592	Communication and Energy Wire and Cable Manufacturing
821	335921	Fiber Optic Cable Manufacturing 
822	335929	Other Communication and Energy Wire Manufacturing 
823	33593	Wiring Device Manufacturing
824	335931	Current-Carrying Wiring Device Manufacturing 
825	335932	Noncurrent-Carrying Wiring Device Manufacturing 
826	33599	All Other Electrical Equipment and Component Manufacturing
827	335991	Carbon and Graphite Product Manufacturing 
828	335999	All Other Miscellaneous Electrical Equipment and Component Manufacturing 
829	336	Transportation Equipment Manufacturing
830	3361	Motor Vehicle Manufacturing
831	33611	Automobile and Light Duty Motor Vehicle Manufacturing
832	336111	Automobile Manufacturing 
833	336112	Light Truck and Utility Vehicle Manufacturing 
834	33612	Heavy Duty Truck Manufacturing
835	336120	Heavy Duty Truck Manufacturing
836	3362	Motor Vehicle Body and Trailer Manufacturing
837	33621	Motor Vehicle Body and Trailer Manufacturing
838	336211	Motor Vehicle Body Manufacturing 
839	336212	Truck Trailer Manufacturing 
840	336213	Motor Home Manufacturing 
841	336214	Travel Trailer and Camper Manufacturing 
842	3363	Motor Vehicle Parts Manufacturing
843	33631	Motor Vehicle Gasoline Engine and Engine Parts Manufacturing
844	336310	Motor Vehicle Gasoline Engine and Engine Parts Manufacturing
845	33632	Motor Vehicle Electrical and Electronic Equipment Manufacturing
846	336320	Motor Vehicle Electrical and Electronic Equipment Manufacturing
847	33633	Motor Vehicle Steering and Suspension Components (except Spring) Manufacturing
848	336330	Motor Vehicle Steering and Suspension Components (except Spring) Manufacturing
849	33634	Motor Vehicle Brake System Manufacturing
850	336340	Motor Vehicle Brake System Manufacturing
851	33635	Motor Vehicle Transmission and Power Train Parts Manufacturing
852	336350	Motor Vehicle Transmission and Power Train Parts Manufacturing
853	33636	Motor Vehicle Seating and Interior Trim Manufacturing
854	336360	Motor Vehicle Seating and Interior Trim Manufacturing
855	33637	Motor Vehicle Metal Stamping
856	336370	Motor Vehicle Metal Stamping
857	33639	Other Motor Vehicle Parts Manufacturing
858	336390	Other Motor Vehicle Parts Manufacturing
859	3364	Aerospace Product and Parts Manufacturing
860	33641	Aerospace Product and Parts Manufacturing
861	336411	Aircraft Manufacturing 
862	336412	Aircraft Engine and Engine Parts Manufacturing 
863	336413	Other Aircraft Parts and Auxiliary Equipment Manufacturing 
864	336414	Guided Missile and Space Vehicle Manufacturing 
865	336415	Guided Missile and Space Vehicle Propulsion Unit and Propulsion Unit Parts Manufacturing 
866	336419	Other Guided Missile and Space Vehicle Parts and Auxiliary Equipment Manufacturing 
867	3365	Railroad Rolling Stock Manufacturing
868	33651	Railroad Rolling Stock Manufacturing
869	336510	Railroad Rolling Stock Manufacturing
870	3366	Ship and Boat Building
871	33661	Ship and Boat Building
872	336611	Ship Building and Repairing 
873	336612	Boat Building 
874	3369	Other Transportation Equipment Manufacturing
875	33699	Other Transportation Equipment Manufacturing
876	336991	Motorcycle, Bicycle, and Parts Manufacturing 
877	336992	Military Armored Vehicle, Tank, and Tank Component Manufacturing 
878	336999	All Other Transportation Equipment Manufacturing 
879	337	Furniture and Related Product Manufacturing
880	3371	Household and Institutional Furniture and Kitchen Cabinet Manufacturing
881	33711	Wood Kitchen Cabinet and Countertop Manufacturing
882	337110	Wood Kitchen Cabinet and Countertop Manufacturing
883	33712	Household and Institutional Furniture Manufacturing
884	337121	Upholstered Household Furniture Manufacturing 
885	337122	Nonupholstered Wood Household Furniture Manufacturing 
886	337124	Metal Household Furniture Manufacturing 
887	337125	Household Furniture (except Wood and Metal) Manufacturing 
888	337127	Institutional Furniture Manufacturing 
889	3372	Office Furniture (including Fixtures) Manufacturing
890	33721	Office Furniture (including Fixtures) Manufacturing
891	337211	Wood Office Furniture Manufacturing 
892	337212	Custom Architectural Woodwork and Millwork Manufacturing 
893	337214	Office Furniture (except Wood) Manufacturing 
894	337215	Showcase, Partition, Shelving, and Locker Manufacturing 
895	3379	Other Furniture Related Product Manufacturing
896	33791	Mattress Manufacturing
897	337910	Mattress Manufacturing
898	33792	Blind and Shade Manufacturing
899	337920	Blind and Shade Manufacturing
900	339	Miscellaneous Manufacturing
901	3391	Medical Equipment and Supplies Manufacturing
902	33911	Medical Equipment and Supplies Manufacturing
903	339112	Surgical and Medical Instrument Manufacturing 
904	339113	Surgical Appliance and Supplies Manufacturing 
905	339114	Dental Equipment and Supplies Manufacturing 
906	339115	Ophthalmic Goods Manufacturing 
907	339116	Dental Laboratories 
908	3399	Other Miscellaneous Manufacturing
909	33991	Jewelry and Silverware Manufacturing
910	339910	Jewelry and Silverware Manufacturing 
911	33992	Sporting and Athletic Goods Manufacturing
912	339920	Sporting and Athletic Goods Manufacturing
913	33993	Doll, Toy, and Game Manufacturing
914	339930	Doll, Toy, and Game Manufacturing
915	33994	Office Supplies (except Paper) Manufacturing
916	339940	Office Supplies (except Paper) Manufacturing
917	33995	Sign Manufacturing
918	339950	Sign Manufacturing
919	33999	All Other Miscellaneous Manufacturing
920	339991	Gasket, Packing, and Sealing Device Manufacturing 
921	339992	Musical Instrument Manufacturing 
922	339993	Fastener, Button, Needle, and Pin Manufacturing 
923	339994	Broom, Brush, and Mop Manufacturing 
924	339995	Burial Casket Manufacturing 
925	339999	All Other Miscellaneous Manufacturing 
926	42	Wholesale Trade
927	423	Merchant Wholesalers, Durable Goods 
928	4231	Motor Vehicle and Motor Vehicle Parts and Supplies Merchant Wholesalers 
929	42311	Automobile and Other Motor Vehicle Merchant Wholesalers 
930	423110	Automobile and Other Motor Vehicle Merchant Wholesalers 
931	42312	Motor Vehicle Supplies and New Parts Merchant Wholesalers 
932	423120	Motor Vehicle Supplies and New Parts Merchant Wholesalers 
933	42313	Tire and Tube Merchant Wholesalers 
934	423130	Tire and Tube Merchant Wholesalers 
935	42314	Motor Vehicle Parts (Used) Merchant Wholesalers 
936	423140	Motor Vehicle Parts (Used) Merchant Wholesalers 
937	4232	Furniture and Home Furnishing Merchant Wholesalers 
938	42321	Furniture Merchant Wholesalers 
939	423210	Furniture Merchant Wholesalers 
940	42322	Home Furnishing Merchant Wholesalers 
941	423220	Home Furnishing Merchant Wholesalers 
942	4233	Lumber and Other Construction Materials Merchant Wholesalers 
943	42331	Lumber, Plywood, Millwork, and Wood Panel Merchant Wholesalers 
944	423310	Lumber, Plywood, Millwork, and Wood Panel Merchant Wholesalers 
945	42332	Brick, Stone, and Related Construction Material Merchant Wholesalers 
946	423320	Brick, Stone, and Related Construction Material Merchant Wholesalers 
947	42333	Roofing, Siding, and Insulation Material Merchant Wholesalers 
948	423330	Roofing, Siding, and Insulation Material Merchant Wholesalers 
949	42339	Other Construction Material Merchant Wholesalers 
950	423390	Other Construction Material Merchant Wholesalers 
951	4234	Professional and Commercial Equipment and Supplies Merchant Wholesalers 
952	42341	Photographic Equipment and Supplies Merchant Wholesalers 
953	423410	Photographic Equipment and Supplies Merchant Wholesalers 
954	42342	Office Equipment Merchant Wholesalers 
955	423420	Office Equipment Merchant Wholesalers 
956	42343	Computer and Computer Peripheral Equipment and Software Merchant Wholesalers 
957	423430	Computer and Computer Peripheral Equipment and Software Merchant Wholesalers 
1127	444110	Home Centers 
958	42344	Other Commercial Equipment Merchant Wholesalers 
959	423440	Other Commercial Equipment Merchant Wholesalers 
960	42345	Medical, Dental, and Hospital Equipment and Supplies Merchant Wholesalers 
961	423450	Medical, Dental, and Hospital Equipment and Supplies Merchant Wholesalers 
962	42346	Ophthalmic Goods Merchant Wholesalers 
963	423460	Ophthalmic Goods Merchant Wholesalers 
964	42349	Other Professional Equipment and Supplies Merchant Wholesalers 
965	423490	Other Professional Equipment and Supplies Merchant Wholesalers 
966	4235	Metal and Mineral (except Petroleum) Merchant Wholesalers 
967	42351	Metal Service Centers and Other Metal Merchant Wholesalers 
968	423510	Metal Service Centers and Other Metal Merchant Wholesalers 
969	42352	Coal and Other Mineral and Ore Merchant Wholesalers 
970	423520	Coal and Other Mineral and Ore Merchant Wholesalers 
971	4236	Household Appliances and Electrical and Electronic Goods Merchant Wholesalers 
972	42361	Electrical Apparatus and Equipment, Wiring Supplies, and Related Equipment Merchant Wholesalers 
973	423610	Electrical Apparatus and Equipment, Wiring Supplies, and Related Equipment Merchant Wholesalers 
974	42362	Household Appliances, Electric Housewares, and Consumer Electronics Merchant Wholesalers 
975	423620	Household Appliances, Electric Housewares, and Consumer Electronics Merchant Wholesalers 
976	42369	Other Electronic Parts and Equipment Merchant Wholesalers 
977	423690	Other Electronic Parts and Equipment Merchant Wholesalers 
978	4237	Hardware, and Plumbing and Heating Equipment and Supplies Merchant Wholesalers 
979	42371	Hardware Merchant Wholesalers 
980	423710	Hardware Merchant Wholesalers 
981	42372	Plumbing and Heating Equipment and Supplies (Hydronics) Merchant Wholesalers 
982	423720	Plumbing and Heating Equipment and Supplies (Hydronics) Merchant Wholesalers 
983	42373	Warm Air Heating and Air-Conditioning Equipment and Supplies Merchant Wholesalers 
984	423730	Warm Air Heating and Air-Conditioning Equipment and Supplies Merchant Wholesalers 
985	42374	Refrigeration Equipment and Supplies Merchant Wholesalers 
986	423740	Refrigeration Equipment and Supplies Merchant Wholesalers 
987	4238	Machinery, Equipment, and Supplies Merchant Wholesalers 
988	42381	Construction and Mining (except Oil Well) Machinery and Equipment Merchant Wholesalers 
989	423810	Construction and Mining (except Oil Well) Machinery and Equipment Merchant Wholesalers 
990	42382	Farm and Garden Machinery and Equipment Merchant Wholesalers 
991	423820	Farm and Garden Machinery and Equipment Merchant Wholesalers 
992	42383	Industrial Machinery and Equipment Merchant Wholesalers 
993	423830	Industrial Machinery and Equipment Merchant Wholesalers 
994	42384	Industrial Supplies Merchant Wholesalers 
995	423840	Industrial Supplies Merchant Wholesalers
996	42385	Service Establishment Equipment and Supplies Merchant Wholesalers 
997	423850	Service Establishment Equipment and Supplies Merchant Wholesalers 
998	42386	Transportation Equipment and Supplies (except Motor Vehicle) Merchant Wholesalers 
999	423860	Transportation Equipment and Supplies (except Motor Vehicle) Merchant Wholesalers 
1000	4239	Miscellaneous Durable Goods Merchant Wholesalers 
1001	42391	Sporting and Recreational Goods and Supplies Merchant Wholesalers
1002	423910	Sporting and Recreational Goods and Supplies Merchant Wholesalers 
1003	42392	Toy and Hobby Goods and Supplies Merchant Wholesalers 
1004	423920	Toy and Hobby Goods and Supplies Merchant Wholesalers 
1005	42393	Recyclable Material Merchant Wholesalers 
1006	423930	Recyclable Material Merchant Wholesalers 
1007	42394	Jewelry, Watch, Precious Stone, and Precious Metal Merchant Wholesalers 
1008	423940	Jewelry, Watch, Precious Stone, and Precious Metal Merchant Wholesalers 
1009	42399	Other Miscellaneous Durable Goods Merchant Wholesalers 
1010	423990	Other Miscellaneous Durable Goods Merchant Wholesalers 
1011	424	Merchant Wholesalers, Nondurable Goods 
1012	4241	Paper and Paper Product Merchant Wholesalers 
1013	42411	Printing and Writing Paper Merchant Wholesalers 
1014	424110	Printing and Writing Paper Merchant Wholesalers 
1015	42412	Stationery and Office Supplies Merchant Wholesalers 
1016	424120	Stationery and Office Supplies Merchant Wholesalers 
1017	42413	Industrial and Personal Service Paper Merchant Wholesalers 
1018	424130	Industrial and Personal Service Paper Merchant Wholesalers 
1019	4242	Drugs and Druggists' Sundries Merchant Wholesalers 
1020	42421	Drugs and Druggists' Sundries Merchant Wholesalers 
1021	424210	Drugs and Druggists' Sundries Merchant Wholesalers 
1022	4243	Apparel, Piece Goods, and Notions Merchant Wholesalers 
1023	42431	Piece Goods, Notions, and Other Dry Goods Merchant Wholesalers 
1024	424310	Piece Goods, Notions, and Other Dry Goods Merchant Wholesalers 
1025	42432	Men's and Boys' Clothing and Furnishings Merchant Wholesalers 
1026	424320	Men's and Boys' Clothing and Furnishings Merchant Wholesalers 
1027	42433	Women's, Children's, and Infants' Clothing and Accessories Merchant Wholesalers 
1028	424330	Women's, Children's, and Infants' Clothing and Accessories Merchant Wholesalers 
1029	42434	Footwear Merchant Wholesalers 
1030	424340	Footwear Merchant Wholesalers 
1031	4244	Grocery and Related Product Merchant Wholesalers 
1032	42441	General Line Grocery Merchant Wholesalers 
1033	424410	General Line Grocery Merchant Wholesalers 
1235	45392	Art Dealers 
1034	42442	Packaged Frozen Food Merchant Wholesalers 
1035	424420	Packaged Frozen Food Merchant Wholesalers 
1036	42443	Dairy Product (except Dried or Canned) Merchant Wholesalers 
1037	424430	Dairy Product (except Dried or Canned) Merchant Wholesalers 
1038	42444	Poultry and Poultry Product Merchant Wholesalers 
1039	424440	Poultry and Poultry Product Merchant Wholesalers 
1040	42445	Confectionery Merchant Wholesalers 
1041	424450	Confectionery Merchant Wholesalers 
1042	42446	Fish and Seafood Merchant Wholesalers 
1043	424460	Fish and Seafood Merchant Wholesalers 
1044	42447	Meat and Meat Product Merchant Wholesalers 
1045	424470	Meat and Meat Product Merchant Wholesalers 
1046	42448	Fresh Fruit and Vegetable Merchant Wholesalers 
1047	424480	Fresh Fruit and Vegetable Merchant Wholesalers 
1048	42449	Other Grocery and Related Products Merchant Wholesalers 
1049	424490	Other Grocery and Related Products Merchant Wholesalers 
1050	4245	Farm Product Raw Material Merchant Wholesalers 
1051	42451	Grain and Field Bean Merchant Wholesalers 
1052	424510	Grain and Field Bean Merchant Wholesalers 
1053	42452	Livestock Merchant Wholesalers 
1054	424520	Livestock Merchant Wholesalers 
1055	42459	Other Farm Product Raw Material Merchant Wholesalers 
1056	424590	Other Farm Product Raw Material Merchant Wholesalers 
1057	4246	Chemical and Allied Products Merchant Wholesalers 
1058	42461	Plastics Materials and Basic Forms and Shapes Merchant Wholesalers 
1059	424610	Plastics Materials and Basic Forms and Shapes Merchant Wholesalers 
1060	42469	Other Chemical and Allied Products Merchant Wholesalers 
1061	424690	Other Chemical and Allied Products Merchant Wholesalers 
1062	4247	Petroleum and Petroleum Products Merchant Wholesalers 
1063	42471	Petroleum Bulk Stations and Terminals 
1064	424710	Petroleum Bulk Stations and Terminals 
1065	42472	Petroleum and Petroleum Products Merchant Wholesalers (except Bulk Stations and Terminals) 
1066	424720	Petroleum and Petroleum Products Merchant Wholesalers (except Bulk Stations and Terminals) 
1067	4248	Beer, Wine, and Distilled Alcoholic Beverage Merchant Wholesalers 
1068	42481	Beer and Ale Merchant Wholesalers 
1069	424810	Beer and Ale Merchant Wholesalers 
1070	42482	Wine and Distilled Alcoholic Beverage Merchant Wholesalers 
1071	424820	Wine and Distilled Alcoholic Beverage Merchant Wholesalers 
1072	4249	Miscellaneous Nondurable Goods Merchant Wholesalers 
1073	42491	Farm Supplies Merchant Wholesalers 
1074	424910	Farm Supplies Merchant Wholesalers 
1075	42492	Book, Periodical, and Newspaper Merchant Wholesalers 
1076	424920	Book, Periodical, and Newspaper Merchant Wholesalers 
1077	42493	Flower, Nursery Stock, and Florists' Supplies Merchant Wholesalers 
1078	424930	Flower, Nursery Stock, and Florists' Supplies Merchant Wholesalers 
1079	42494	Tobacco and Tobacco Product Merchant Wholesalers 
1080	424940	Tobacco and Tobacco Product Merchant Wholesalers 
1081	42495	Paint, Varnish, and Supplies Merchant Wholesalers 
1082	424950	Paint, Varnish, and Supplies Merchant Wholesalers 
1083	42499	Other Miscellaneous Nondurable Goods Merchant Wholesalers 
1084	424990	Other Miscellaneous Nondurable Goods Merchant Wholesalers 
1085	425	Wholesale Electronic Markets and Agents and Brokers 
1086	4251	Wholesale Electronic Markets and Agents and Brokers 
1087	42511	Business to Business Electronic Markets 
1088	425110	Business to Business Electronic Markets 
1089	42512	Wholesale Trade Agents and Brokers 
1090	425120	Wholesale Trade Agents and Brokers 
1091	44-45	Retail Trade
1092	441	Motor Vehicle and Parts Dealers 
1093	4411	Automobile Dealers 
1094	44111	New Car Dealers 
1095	441110	New Car Dealers 
1096	44112	Used Car Dealers 
1097	441120	Used Car Dealers 
1098	4412	Other Motor Vehicle Dealers 
1099	44121	Recreational Vehicle Dealers 
1100	441210	Recreational Vehicle Dealers 
1101	44122	Motorcycle, Boat, and Other Motor Vehicle Dealers 
1102	441222	Boat Dealers 
1103	441228	Motorcycle, ATV, and All Other Motor Vehicle Dealers 
1104	4413	Automotive Parts, Accessories, and Tire Stores 
1105	44131	Automotive Parts and Accessories Stores 
1106	441310	Automotive Parts and Accessories Stores 
1107	44132	Tire Dealers 
1108	441320	Tire Dealers 
1109	442	Furniture and Home Furnishings Stores 
1110	4421	Furniture Stores 
1111	44211	Furniture Stores 
1112	442110	Furniture Stores 
1113	4422	Home Furnishings Stores 
1114	44221	Floor Covering Stores 
1115	442210	Floor Covering Stores 
1116	44229	Other Home Furnishings Stores 
1117	442291	Window Treatment Stores 
1118	442299	All Other Home Furnishings Stores 
1119	443	Electronics and Appliance Stores 
1120	4431	Electronics and Appliance Stores 
1121	44314	Electronics and Appliance Stores 
1122	443141	Household Appliance Stores 
1123	443142	Electronics Stores 
1124	444	Building Material and Garden Equipment and Supplies Dealers 
1125	4441	Building Material and Supplies Dealers 
1128	44412	Paint and Wallpaper Stores 
1129	444120	Paint and Wallpaper Stores 
1130	44413	Hardware Stores 
1131	444130	Hardware Stores 
1132	44419	Other Building Material Dealers 
1133	444190	Other Building Material Dealers 
1134	4442	Lawn and Garden Equipment and Supplies Stores 
1135	44421	Outdoor Power Equipment Stores 
1136	444210	Outdoor Power Equipment Stores 
1137	44422	Nursery, Garden Center, and Farm Supply Stores 
1138	444220	Nursery, Garden Center, and Farm Supply Stores 
1139	445	Food and Beverage Stores 
1140	4451	Grocery Stores 
1141	44511	Supermarkets and Other Grocery (except Convenience) Stores 
1142	445110	Supermarkets and Other Grocery (except Convenience) Stores 
1143	44512	Convenience Stores 
1144	445120	Convenience Stores 
1145	4452	Specialty Food Stores 
1146	44521	Meat Markets 
1147	445210	Meat Markets 
1148	44522	Fish and Seafood Markets 
1149	445220	Fish and Seafood Markets 
1150	44523	Fruit and Vegetable Markets 
1151	445230	Fruit and Vegetable Markets 
1152	44529	Other Specialty Food Stores 
1153	445291	Baked Goods Stores 
1154	445292	Confectionery and Nut Stores 
1155	445299	All Other Specialty Food Stores 
1156	4453	Beer, Wine, and Liquor Stores 
1157	44531	Beer, Wine, and Liquor Stores 
1158	445310	Beer, Wine, and Liquor Stores 
1159	446	Health and Personal Care Stores 
1160	4461	Health and Personal Care Stores 
1161	44611	Pharmacies and Drug Stores 
1162	446110	Pharmacies and Drug Stores 
1163	44612	Cosmetics, Beauty Supplies, and Perfume Stores 
1164	446120	Cosmetics, Beauty Supplies, and Perfume Stores 
1165	44613	Optical Goods Stores 
1166	446130	Optical Goods Stores 
1167	44619	Other Health and Personal Care Stores 
1168	446191	Food (Health) Supplement Stores 
1169	446199	All Other Health and Personal Care Stores 
1170	447	Gasoline Stations 
1171	4471	Gasoline Stations 
1172	44711	Gasoline Stations with Convenience Stores 
1173	447110	Gasoline Stations with Convenience Stores 
1174	44719	Other Gasoline Stations 
1175	447190	Other Gasoline Stations 
1176	448	Clothing and Clothing Accessories Stores 
1177	4481	Clothing Stores 
1178	44811	Men's Clothing Stores 
1179	448110	Men's Clothing Stores 
1180	44812	Women's Clothing Stores 
1181	448120	Women's Clothing Stores 
1182	44813	Children's and Infants' Clothing Stores 
1183	448130	Children's and Infants' Clothing Stores 
1184	44814	Family Clothing Stores 
1185	448140	Family Clothing Stores 
1186	44815	Clothing Accessories Stores 
1187	448150	Clothing Accessories Stores 
1188	44819	Other Clothing Stores 
1189	448190	Other Clothing Stores 
1190	4482	Shoe Stores 
1191	44821	Shoe Stores 
1192	448210	Shoe Stores 
1193	4483	Jewelry, Luggage, and Leather Goods Stores 
1194	44831	Jewelry Stores 
1195	448310	Jewelry Stores 
1196	44832	Luggage and Leather Goods Stores 
1197	448320	Luggage and Leather Goods Stores 
1198	451	Sporting Goods, Hobby, Musical Instrument, and Book Stores 
1199	4511	Sporting Goods, Hobby, and Musical Instrument Stores 
1200	45111	Sporting Goods Stores 
1201	451110	Sporting Goods Stores 
1202	45112	Hobby, Toy, and Game Stores 
1203	451120	Hobby, Toy, and Game Stores 
1204	45113	Sewing, Needlework, and Piece Goods Stores 
1205	451130	Sewing, Needlework, and Piece Goods Stores 
1206	45114	Musical Instrument and Supplies Stores 
1207	451140	Musical Instrument and Supplies Stores 
1208	4512	Book Stores and News Dealers 
1209	45121	Book Stores and News Dealers 
1210	451211	Book Stores 
1211	451212	News Dealers and Newsstands 
1212	452	General Merchandise Stores 
1213	4522	Department Stores 
1214	45221	Department Stores 
1215	452210	Department Stores 
1216	4523	General Merchandise Stores, including Warehouse Clubs and Supercenters 
1217	45231	General Merchandise Stores, including Warehouse Clubs and Supercenters 
1218	452311	Warehouse Clubs and Supercenters 
1219	452319	All Other General Merchandise Stores 
1220	453	Miscellaneous Store Retailers 
1221	4531	Florists 
1222	45311	Florists 
1223	453110	Florists 
1224	4532	Office Supplies, Stationery, and Gift Stores 
1225	45321	Office Supplies and Stationery Stores 
1226	453210	Office Supplies and Stationery Stores 
1227	45322	Gift, Novelty, and Souvenir Stores 
1228	453220	Gift, Novelty, and Souvenir Stores 
1229	4533	Used Merchandise Stores 
1230	45331	Used Merchandise Stores 
1231	453310	Used Merchandise Stores 
1232	4539	Other Miscellaneous Store Retailers 
1233	45391	Pet and Pet Supplies Stores 
1234	453910	Pet and Pet Supplies Stores 
1236	453920	Art Dealers 
1237	45393	Manufactured (Mobile) Home Dealers 
1238	453930	Manufactured (Mobile) Home Dealers 
1239	45399	All Other Miscellaneous Store Retailers 
1240	453991	Tobacco Stores 
1241	453998	All Other Miscellaneous Store Retailers (except Tobacco Stores) 
1242	454	Nonstore Retailers 
1243	4541	Electronic Shopping and Mail-Order Houses 
1244	45411	Electronic Shopping and Mail-Order Houses 
1245	454110	Electronic Shopping and Mail-Order Houses 
1246	4542	Vending Machine Operators 
1247	45421	Vending Machine Operators 
1248	454210	Vending Machine Operators 
1249	4543	Direct Selling Establishments 
1250	45431	Fuel Dealers 
1251	454310	Fuel Dealers 
1252	45439	Other Direct Selling Establishments 
1253	454390	Other Direct Selling Establishments 
1254	48-49	Transportation and Warehousing
1255	481	Air Transportation
1256	4811	Scheduled Air Transportation
1257	48111	Scheduled Air Transportation
1258	481111	Scheduled Passenger Air Transportation 
1259	481112	Scheduled Freight Air Transportation 
1260	4812	Nonscheduled Air Transportation
1261	48121	Nonscheduled Air Transportation
1262	481211	Nonscheduled Chartered Passenger Air Transportation 
1263	481212	Nonscheduled Chartered Freight Air Transportation 
1264	481219	Other Nonscheduled Air Transportation 
1265	482	Rail Transportation
1266	4821	Rail Transportation
1267	48211	Rail Transportation
1268	482111	Line-Haul Railroads 
1269	482112	Short Line Railroads 
1270	483	Water Transportation
1271	4831	Deep Sea, Coastal, and Great Lakes Water Transportation
1272	48311	Deep Sea, Coastal, and Great Lakes Water Transportation
1273	483111	Deep Sea Freight Transportation 
1274	483112	Deep Sea Passenger Transportation 
1275	483113	Coastal and Great Lakes Freight Transportation 
1276	483114	Coastal and Great Lakes Passenger Transportation 
1277	4832	Inland Water Transportation
1278	48321	Inland Water Transportation
1279	483211	Inland Water Freight Transportation 
1280	483212	Inland Water Passenger Transportation 
1281	484	Truck Transportation
1282	4841	General Freight Trucking
1283	48411	General Freight Trucking, Local
1284	484110	General Freight Trucking, Local 
1285	48412	General Freight Trucking, Long-Distance
1286	484121	General Freight Trucking, Long-Distance, Truckload 
1287	484122	General Freight Trucking, Long-Distance, Less Than Truckload 
1288	4842	Specialized Freight Trucking
1289	48421	Used Household and Office Goods Moving
1290	484210	Used Household and Office Goods Moving
1291	48422	Specialized Freight (except Used Goods) Trucking, Local
1292	484220	Specialized Freight (except Used Goods) Trucking, Local 
1293	48423	Specialized Freight (except Used Goods) Trucking, Long-Distance
1294	484230	Specialized Freight (except Used Goods) Trucking, Long-Distance 
1295	485	Transit and Ground Passenger Transportation
1296	4851	Urban Transit Systems
1297	48511	Urban Transit Systems
1298	485111	Mixed Mode Transit Systems 
1299	485112	Commuter Rail Systems 
1300	485113	Bus and Other Motor Vehicle Transit Systems 
1301	485119	Other Urban Transit Systems 
1302	4852	Interurban and Rural Bus Transportation
1303	48521	Interurban and Rural Bus Transportation
1304	485210	Interurban and Rural Bus Transportation
1305	4853	Taxi and Limousine Service
1306	48531	Taxi Service
1307	485310	Taxi Service 
1308	48532	Limousine Service
1309	485320	Limousine Service
1310	4854	School and Employee Bus Transportation
1311	48541	School and Employee Bus Transportation
1312	485410	School and Employee Bus Transportation
1313	4855	Charter Bus Industry
1314	48551	Charter Bus Industry
1315	485510	Charter Bus Industry
1316	4859	Other Transit and Ground Passenger Transportation
1317	48599	Other Transit and Ground Passenger Transportation
1318	485991	Special Needs Transportation 
1319	485999	All Other Transit and Ground Passenger Transportation 
1320	486	Pipeline Transportation
1321	4861	Pipeline Transportation of Crude Oil
1322	48611	Pipeline Transportation of Crude Oil
1323	486110	Pipeline Transportation of Crude Oil
1324	4862	Pipeline Transportation of Natural Gas
1325	48621	Pipeline Transportation of Natural Gas
1326	486210	Pipeline Transportation of Natural Gas
1327	4869	Other Pipeline Transportation
1328	48691	Pipeline Transportation of Refined Petroleum Products
1329	486910	Pipeline Transportation of Refined Petroleum Products
1330	48699	All Other Pipeline Transportation
1331	486990	All Other Pipeline Transportation
1332	487	Scenic and Sightseeing Transportation
1333	4871	Scenic and Sightseeing Transportation, Land
1334	48711	Scenic and Sightseeing Transportation, Land
1335	487110	Scenic and Sightseeing Transportation, Land
1539	524291	Claims Adjusting 
1336	4872	Scenic and Sightseeing Transportation, Water
1337	48721	Scenic and Sightseeing Transportation, Water
1338	487210	Scenic and Sightseeing Transportation, Water
1339	4879	Scenic and Sightseeing Transportation, Other
1340	48799	Scenic and Sightseeing Transportation, Other
1341	487990	Scenic and Sightseeing Transportation, Other
1342	488	Support Activities for Transportation
1343	4881	Support Activities for Air Transportation
1344	48811	Airport Operations
1345	488111	Air Traffic Control
1346	488119	Other Airport Operations 
1347	48819	Other Support Activities for Air Transportation
1348	488190	Other Support Activities for Air Transportation
1349	4882	Support Activities for Rail Transportation
1350	48821	Support Activities for Rail Transportation
1351	488210	Support Activities for Rail Transportation
1352	4883	Support Activities for Water Transportation
1353	48831	Port and Harbor Operations
1354	488310	Port and Harbor Operations
1355	48832	Marine Cargo Handling
1356	488320	Marine Cargo Handling
1357	48833	Navigational Services to Shipping
1358	488330	Navigational Services to Shipping 
1359	48839	Other Support Activities for Water Transportation
1360	488390	Other Support Activities for Water Transportation
1361	4884	Support Activities for Road Transportation
1362	48841	Motor Vehicle Towing
1363	488410	Motor Vehicle Towing
1364	48849	Other Support Activities for Road Transportation
1365	488490	Other Support Activities for Road Transportation 
1366	4885	Freight Transportation Arrangement
1367	48851	Freight Transportation Arrangement
1368	488510	Freight Transportation Arrangement 
1369	4889	Other Support Activities for Transportation
1370	48899	Other Support Activities for Transportation
1371	488991	Packing and Crating 
1372	488999	All Other Support Activities for Transportation 
1373	491	Postal Service
1374	4911	Postal Service
1375	49111	Postal Service
1376	491110	Postal Service
1377	492	Couriers and Messengers
1378	4921	Couriers and Express Delivery Services
1379	49211	Couriers and Express Delivery Services
1380	492110	Couriers and Express Delivery Services
1381	4922	Local Messengers and Local Delivery
1382	49221	Local Messengers and Local Delivery
1383	492210	Local Messengers and Local Delivery
1384	493	Warehousing and Storage
1385	4931	Warehousing and Storage
1386	49311	General Warehousing and Storage
1387	493110	General Warehousing and Storage 
1388	49312	Refrigerated Warehousing and Storage
1389	493120	Refrigerated Warehousing and Storage
1390	49313	Farm Product Warehousing and Storage
1391	493130	Farm Product Warehousing and Storage
1392	49319	Other Warehousing and Storage
1393	493190	Other Warehousing and Storage
1394	51	Information
1395	511	Publishing Industries (except Internet)
1396	5111	Newspaper, Periodical, Book, and Directory Publishers
1397	51111	Newspaper Publishers
1398	511110	Newspaper Publishers 
1399	51112	Periodical Publishers
1400	511120	Periodical Publishers 
1401	51113	Book Publishers
1402	511130	Book Publishers 
1403	51114	Directory and Mailing List Publishers
1404	511140	Directory and Mailing List Publishers 
1405	51119	Other Publishers
1406	511191	Greeting Card Publishers 
1407	511199	All Other Publishers 
1408	5112	Software Publishers
1409	51121	Software Publishers
1410	511210	Software Publishers
1411	512	Motion Picture and Sound Recording Industries
1412	5121	Motion Picture and Video Industries
1413	51211	Motion Picture and Video Production
1414	512110	Motion Picture and Video Production 
1415	51212	Motion Picture and Video Distribution
1416	512120	Motion Picture and Video Distribution
1417	51213	Motion Picture and Video Exhibition
1418	512131	Motion Picture Theaters (except Drive-Ins) 
1419	512132	Drive-In Motion Picture Theaters 
1420	51219	Postproduction Services and Other Motion Picture and Video Industries
1421	512191	Teleproduction and Other Postproduction Services 
1422	512199	Other Motion Picture and Video Industries 
1423	5122	Sound Recording Industries
1424	51223	Music Publishers
1425	512230	Music Publishers
1426	51224	Sound Recording Studios
1427	512240	Sound Recording Studios
1428	51225	Record Production and Distribution
1429	512250	Record Production and Distribution
1430	51229	Other Sound Recording Industries
1431	512290	Other Sound Recording Industries
1432	515	Broadcasting (except Internet)
1433	5151	Radio and Television Broadcasting
1434	51511	Radio Broadcasting
1435	515111	Radio Networks 
1436	515112	Radio Stations 
1437	51512	Television Broadcasting
1438	515120	Television Broadcasting
1439	5152	Cable and Other Subscription Programming
1440	51521	Cable and Other Subscription Programming
1441	515210	Cable and Other Subscription Programming
1442	517	Telecommunications
1443	5173	Wired and Wireless Telecommunications Carriers
1444	51731	Wired and Wireless Telecommunications Carriers
1445	517311	Wired Telecommunications Carriers 
1446	517312	Wireless Telecommunications Carriers (except Satellite)
1447	5174	Satellite Telecommunications
1448	51741	Satellite Telecommunications
1449	517410	Satellite Telecommunications
1450	5179	Other Telecommunications
1451	51791	Other Telecommunications
1452	517911	Telecommunications Resellers 
1453	517919	All Other Telecommunications 
1454	518	Data Processing, Hosting, and Related Services
1455	5182	Data Processing, Hosting, and Related Services
1456	51821	Data Processing, Hosting, and Related Services
1457	518210	Data Processing, Hosting, and Related Services
1458	519	Other Information Services
1459	5191	Other Information Services
1460	51911	News Syndicates
1461	519110	News Syndicates
1462	51912	Libraries and Archives
1463	519120	Libraries and Archives 
1464	51913	Internet Publishing and Broadcasting and Web Search Portals
1465	519130	Internet Publishing and Broadcasting and Web Search Portals
1466	51919	All Other Information Services
1467	519190	All Other Information Services
1468	52	Finance and Insurance
1469	521	Monetary Authorities-Central Bank
1470	5211	Monetary Authorities-Central Bank
1471	52111	Monetary Authorities-Central Bank
1472	521110	Monetary Authorities-Central Bank
1473	522	Credit Intermediation and Related Activities
1474	5221	Depository Credit Intermediation 
1475	52211	Commercial Banking 
1476	522110	Commercial Banking 
1477	52212	Savings Institutions 
1478	522120	Savings Institutions 
1479	52213	Credit Unions 
1480	522130	Credit Unions 
1481	52219	Other Depository Credit Intermediation 
1482	522190	Other Depository Credit Intermediation 
1483	5222	Nondepository Credit Intermediation 
1484	52221	Credit Card Issuing 
1485	522210	Credit Card Issuing 
1486	52222	Sales Financing 
1487	522220	Sales Financing 
1488	52229	Other Nondepository Credit Intermediation 
1489	522291	Consumer Lending 
1490	522292	Real Estate Credit 
1491	522293	International Trade Financing 
1492	522294	Secondary Market Financing 
1493	522298	All Other Nondepository Credit Intermediation 
1494	5223	Activities Related to Credit Intermediation 
1495	52231	Mortgage and Nonmortgage Loan Brokers 
1496	522310	Mortgage and Nonmortgage Loan Brokers 
1497	52232	Financial Transactions Processing, Reserve, and Clearinghouse Activities 
1498	522320	Financial Transactions Processing, Reserve, and Clearinghouse Activities 
1499	52239	Other Activities Related to Credit Intermediation 
1500	522390	Other Activities Related to Credit Intermediation 
1501	523	Securities, Commodity Contracts, and Other Financial Investments and Related Activities
1502	5231	Securities and Commodity Contracts Intermediation and Brokerage
1503	52311	Investment Banking and Securities Dealing 
1504	523110	Investment Banking and Securities Dealing 
1505	52312	Securities Brokerage 
1506	523120	Securities Brokerage 
1507	52313	Commodity Contracts Dealing 
1508	523130	Commodity Contracts Dealing 
1509	52314	Commodity Contracts Brokerage 
1510	523140	Commodity Contracts Brokerage 
1511	5232	Securities and Commodity Exchanges
1512	52321	Securities and Commodity Exchanges
1513	523210	Securities and Commodity Exchanges
1514	5239	Other Financial Investment Activities
1515	52391	Miscellaneous Intermediation 
1516	523910	Miscellaneous Intermediation 
1517	52392	Portfolio Management 
1518	523920	Portfolio Management 
1519	52393	Investment Advice 
1520	523930	Investment Advice 
1521	52399	All Other Financial Investment Activities 
1522	523991	Trust, Fiduciary, and Custody Activities 
1523	523999	Miscellaneous Financial Investment Activities 
1524	524	Insurance Carriers and Related Activities
1525	5241	Insurance Carriers
1526	52411	Direct Life, Health, and Medical Insurance Carriers 
1527	524113	Direct Life Insurance Carriers 
1528	524114	Direct Health and Medical Insurance Carriers 
1529	52412	Direct Insurance (except Life, Health, and Medical) Carriers 
1530	524126	Direct Property and Casualty Insurance Carriers 
1531	524127	Direct Title Insurance Carriers 
1532	524128	Other Direct Insurance (except Life, Health, and Medical) Carriers 
1533	52413	Reinsurance Carriers 
1534	524130	Reinsurance Carriers 
1535	5242	Agencies, Brokerages, and Other Insurance Related Activities
1536	52421	Insurance Agencies and Brokerages 
1537	524210	Insurance Agencies and Brokerages 
1538	52429	Other Insurance Related Activities 
1540	524292	Third Party Administration of Insurance and Pension Funds 
1541	524298	All Other Insurance Related Activities 
1542	525	Funds, Trusts, and Other Financial Vehicles 
1543	5251	Insurance and Employee Benefit Funds 
1544	52511	Pension Funds 
1545	525110	Pension Funds 
1546	52512	Health and Welfare Funds 
1547	525120	Health and Welfare Funds 
1548	52519	Other Insurance Funds 
1549	525190	Other Insurance Funds 
1550	5259	Other Investment Pools and Funds
1551	52591	Open-End Investment Funds 
1552	525910	Open-End Investment Funds 
1553	52592	Trusts, Estates, and Agency Accounts 
1554	525920	Trusts, Estates, and Agency Accounts 
1555	52599	Other Financial Vehicles 
1556	525990	Other Financial Vehicles 
1557	53	Real Estate and Rental and Leasing
1558	531	Real Estate
1559	5311	Lessors of Real Estate
1560	53111	Lessors of Residential Buildings and Dwellings 
1561	531110	Lessors of Residential Buildings and Dwellings 
1562	53112	Lessors of Nonresidential Buildings (except Miniwarehouses) 
1563	531120	Lessors of Nonresidential Buildings (except Miniwarehouses) 
1564	53113	Lessors of Miniwarehouses and Self-Storage Units 
1565	531130	Lessors of Miniwarehouses and Self-Storage Units 
1566	53119	Lessors of Other Real Estate Property 
1567	531190	Lessors of Other Real Estate Property 
1568	5312	Offices of Real Estate Agents and Brokers
1569	53121	Offices of Real Estate Agents and Brokers
1570	531210	Offices of Real Estate Agents and Brokers
1571	5313	Activities Related to Real Estate
1572	53131	Real Estate Property Managers 
1573	531311	Residential Property Managers 
1574	531312	Nonresidential Property Managers 
1575	53132	Offices of Real Estate Appraisers 
1576	531320	Offices of Real Estate Appraisers 
1577	53139	Other Activities Related to Real Estate 
1578	531390	Other Activities Related to Real Estate 
1579	532	Rental and Leasing Services
1580	5321	Automotive Equipment Rental and Leasing
1581	53211	Passenger Car Rental and Leasing
1582	532111	Passenger Car Rental 
1583	532112	Passenger Car Leasing 
1584	53212	Truck, Utility Trailer, and RV (Recreational Vehicle) Rental and Leasing
1585	532120	Truck, Utility Trailer, and RV (Recreational Vehicle) Rental and Leasing 
1586	5322	Consumer Goods Rental
1587	53221	Consumer Electronics and Appliances Rental
1588	532210	Consumer Electronics and Appliances Rental
1589	53228	Other Consumer Goods Rental 
1590	532281	Formal Wear and Costume Rental
1591	532282	Video Tape and Disc Rental
1592	532283	Home Health Equipment Rental 
1593	532284	Recreational Goods Rental 
1594	532289	All Other Consumer Goods Rental 
1595	5323	General Rental Centers
1596	53231	General Rental Centers
1597	532310	General Rental Centers
1598	5324	Commercial and Industrial Machinery and Equipment Rental and Leasing
1599	53241	Construction, Transportation, Mining, and Forestry Machinery and Equipment Rental and Leasing
1600	532411	Commercial Air, Rail, and Water Transportation Equipment Rental and Leasing 
1601	532412	Construction, Mining, and Forestry Machinery and Equipment Rental and Leasing 
1602	53242	Office Machinery and Equipment Rental and Leasing
1603	532420	Office Machinery and Equipment Rental and Leasing
1604	53249	Other Commercial and Industrial Machinery and Equipment Rental and Leasing
1605	532490	Other Commercial and Industrial Machinery and Equipment Rental and Leasing 
1606	533	Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)
1607	5331	Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)
1608	53311	Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)
1609	533110	Lessors of Nonfinancial Intangible Assets (except Copyrighted Works)
1610	54	Professional, Scientific, and Technical Services
1611	541	Professional, Scientific, and Technical Services
1612	5411	Legal Services
1613	54111	Offices of Lawyers
1614	541110	Offices of Lawyers
1615	54112	Offices of Notaries
1616	541120	Offices of Notaries
1617	54119	Other Legal Services
1618	541191	Title Abstract and Settlement Offices 
1619	541199	All Other Legal Services 
1620	5412	Accounting, Tax Preparation, Bookkeeping, and Payroll Services
1621	54121	Accounting, Tax Preparation, Bookkeeping, and Payroll Services
1622	541211	Offices of Certified Public Accountants 
1623	541213	Tax Preparation Services 
1624	541214	Payroll Services 
1625	541219	Other Accounting Services 
1626	5413	Architectural, Engineering, and Related Services
1627	54131	Architectural Services
1628	541310	Architectural Services
1629	54132	Landscape Architectural Services
1630	541320	Landscape Architectural Services
1631	54133	Engineering Services
1632	541330	Engineering Services
1633	54134	Drafting Services
1634	541340	Drafting Services
1635	54135	Building Inspection Services
1636	541350	Building Inspection Services
1637	54136	Geophysical Surveying and Mapping Services
1638	541360	Geophysical Surveying and Mapping Services
1639	54137	Surveying and Mapping (except Geophysical) Services
1640	541370	Surveying and Mapping (except Geophysical) Services
1641	54138	Testing Laboratories
1642	541380	Testing Laboratories
1643	5414	Specialized Design Services
1644	54141	Interior Design Services
1645	541410	Interior Design Services
1646	54142	Industrial Design Services
1647	541420	Industrial Design Services
1648	54143	Graphic Design Services
1649	541430	Graphic Design Services
1650	54149	Other Specialized Design Services
1651	541490	Other Specialized Design Services
1652	5415	Computer Systems Design and Related Services
1653	54151	Computer Systems Design and Related Services
1654	541511	Custom Computer Programming Services 
1655	541512	Computer Systems Design Services 
1656	541513	Computer Facilities Management Services 
1657	541519	Other Computer Related Services
1658	5416	Management, Scientific, and Technical Consulting Services
1659	54161	Management Consulting Services
1660	541611	Administrative Management and General Management Consulting Services 
1661	541612	Human Resources Consulting Services 
1662	541613	Marketing Consulting Services 
1663	541614	Process, Physical Distribution, and Logistics Consulting Services 
1664	541618	Other Management Consulting Services 
1665	54162	Environmental Consulting Services
1666	541620	Environmental Consulting Services
1667	54169	Other Scientific and Technical Consulting Services
1668	541690	Other Scientific and Technical Consulting Services
1669	5417	Scientific Research and Development Services
1670	54171	Research and Development in the Physical, Engineering, and Life Sciences
1671	541713	Research and Development in Nanotechnology 
1672	541714	Research and Development in Biotechnology (except Nanobiotechnology)
1673	541715	Research and Development in the Physical, Engineering, and Life Sciences (except Nanotechnology and Biotechnology) 
1674	54172	Research and Development in the Social Sciences and Humanities
1675	541720	Research and Development in the Social Sciences and Humanities 
1676	5418	Advertising, Public Relations, and Related Services
1677	54181	Advertising Agencies
1678	541810	Advertising Agencies
1679	54182	Public Relations Agencies
1680	541820	Public Relations Agencies
1681	54183	Media Buying Agencies
1682	541830	Media Buying Agencies
1683	54184	Media Representatives
1684	541840	Media Representatives
1685	54185	Outdoor Advertising
1686	541850	Outdoor Advertising
1687	54186	Direct Mail Advertising
1688	541860	Direct Mail Advertising
1689	54187	Advertising Material Distribution Services
1690	541870	Advertising Material Distribution Services
1691	54189	Other Services Related to Advertising
1692	541890	Other Services Related to Advertising 
1693	5419	Other Professional, Scientific, and Technical Services
1694	54191	Marketing Research and Public Opinion Polling
1695	541910	Marketing Research and Public Opinion Polling
1696	54192	Photographic Services
1697	541921	Photography Studios, Portrait 
1698	541922	Commercial Photography 
1699	54193	Translation and Interpretation Services
1700	541930	Translation and Interpretation Services
1701	54194	Veterinary Services
1702	541940	Veterinary Services 
1703	54199	All Other Professional, Scientific, and Technical Services
1704	541990	All Other Professional, Scientific, and Technical Services
1705	55	Management of Companies and Enterprises
1706	551	Management of Companies and Enterprises
1707	5511	Management of Companies and Enterprises
1708	55111	Management of Companies and Enterprises
1709	551111	Offices of Bank Holding Companies 
1710	551112	Offices of Other Holding Companies 
1711	551114	Corporate, Subsidiary, and Regional Managing Offices 
1712	56	Administrative and Support and Waste Management and Remediation Services
1713	561	Administrative and Support Services
1714	5611	Office Administrative Services
1715	56111	Office Administrative Services
1716	561110	Office Administrative Services
1717	5612	Facilities Support Services
1718	56121	Facilities Support Services
1719	561210	Facilities Support Services
1720	5613	Employment Services
1721	56131	Employment Placement Agencies and Executive Search Services
1722	561311	Employment Placement Agencies 
1723	561312	Executive Search Services 
1724	56132	Temporary Help Services
1725	561320	Temporary Help Services
1726	56133	Professional Employer Organizations
1727	561330	Professional Employer Organizations
1728	5614	Business Support Services
1729	56141	Document Preparation Services
1730	561410	Document Preparation Services
1731	56142	Telephone Call Centers
1732	561421	Telephone Answering Services 
1733	561422	Telemarketing Bureaus and Other Contact Centers 
1734	56143	Business Service Centers
1735	561431	Private Mail Centers 
1736	561439	Other Business Service Centers (including Copy Shops) 
1737	56144	Collection Agencies
1738	561440	Collection Agencies
1739	56145	Credit Bureaus
1740	561450	Credit Bureaus
1741	56149	Other Business Support Services
1742	561491	Repossession Services 
1743	561492	Court Reporting and Stenotype Services 
1744	561499	All Other Business Support Services 
1745	5615	Travel Arrangement and Reservation Services
1746	56151	Travel Agencies
1747	561510	Travel Agencies
1748	56152	Tour Operators
1749	561520	Tour Operators
1750	56159	Other Travel Arrangement and Reservation Services
1751	561591	Convention and Visitors Bureaus 
1752	561599	All Other Travel Arrangement and Reservation Services 
1753	5616	Investigation and Security Services
1754	56161	Investigation, Guard, and Armored Car Services
1755	561611	Investigation Services 
1756	561612	Security Guards and Patrol Services 
1757	561613	Armored Car Services 
1758	56162	Security Systems Services
1759	561621	Security Systems Services (except Locksmiths) 
1760	561622	Locksmiths 
1761	5617	Services to Buildings and Dwellings
1762	56171	Exterminating and Pest Control Services
1763	561710	Exterminating and Pest Control Services
1764	56172	Janitorial Services
1765	561720	Janitorial Services 
1766	56173	Landscaping Services
1767	561730	Landscaping Services
1768	56174	Carpet and Upholstery Cleaning Services
1769	561740	Carpet and Upholstery Cleaning Services
1770	56179	Other Services to Buildings and Dwellings
1771	561790	Other Services to Buildings and Dwellings 
1772	5619	Other Support Services
1773	56191	Packaging and Labeling Services
1774	561910	Packaging and Labeling Services
1775	56192	Convention and Trade Show Organizers
1776	561920	Convention and Trade Show Organizers
1777	56199	All Other Support Services
1778	561990	All Other Support Services
1779	562	Waste Management and Remediation Services
1780	5621	Waste Collection 
1781	56211	Waste Collection 
1782	562111	Solid Waste Collection 
1783	562112	Hazardous Waste Collection 
1784	562119	Other Waste Collection 
1785	5622	Waste Treatment and Disposal 
1786	56221	Waste Treatment and Disposal 
1787	562211	Hazardous Waste Treatment and Disposal 
1788	562212	Solid Waste Landfill 
1789	562213	Solid Waste Combustors and Incinerators 
1790	562219	Other Nonhazardous Waste Treatment and Disposal 
1791	5629	Remediation and Other Waste Management Services 
1792	56291	Remediation Services 
1793	562910	Remediation Services 
1794	56292	Materials Recovery Facilities 
1795	562920	Materials Recovery Facilities 
1796	56299	All Other Waste Management Services 
1797	562991	Septic Tank and Related Services 
1798	562998	All Other Miscellaneous Waste Management Services 
1799	61	Educational Services
1800	611	Educational Services
1801	6111	Elementary and Secondary Schools
1802	61111	Elementary and Secondary Schools 
1803	611110	Elementary and Secondary Schools 
1804	6112	Junior Colleges
1805	61121	Junior Colleges
1806	611210	Junior Colleges 
1807	6113	Colleges, Universities, and Professional Schools
1808	61131	Colleges, Universities, and Professional Schools
1809	611310	Colleges, Universities, and Professional Schools 
1810	6114	Business Schools and Computer and Management Training
1811	61141	Business and Secretarial Schools
1812	611410	Business and Secretarial Schools 
1813	61142	Computer Training
1814	611420	Computer Training 
1815	61143	Professional and Management Development Training
1816	611430	Professional and Management Development Training 
1817	6115	Technical and Trade Schools 
1818	61151	Technical and Trade Schools
1819	611511	Cosmetology and Barber Schools 
1820	611512	Flight Training 
1821	611513	Apprenticeship Training 
1822	611519	Other Technical and Trade Schools 
1823	6116	Other Schools and Instruction
1824	61161	Fine Arts Schools
1825	611610	Fine Arts Schools 
1826	61162	Sports and Recreation Instruction
1827	611620	Sports and Recreation Instruction 
1828	61163	Language Schools
1829	611630	Language Schools 
1830	61169	All Other Schools and Instruction
1831	611691	Exam Preparation and Tutoring 
1832	611692	Automobile Driving Schools 
1833	611699	All Other Miscellaneous Schools and Instruction 
1834	6117	Educational Support Services
1835	61171	Educational Support Services
1836	611710	Educational Support Services
1837	62	Health Care and Social Assistance
1838	621	Ambulatory Health Care Services
1839	6211	Offices of Physicians
1840	62111	Offices of Physicians
1841	621111	Offices of Physicians (except Mental Health Specialists) 
1842	621112	Offices of Physicians, Mental Health Specialists 
1843	6212	Offices of Dentists
1844	62121	Offices of Dentists
1845	621210	Offices of Dentists 
1846	6213	Offices of Other Health Practitioners
1847	62131	Offices of Chiropractors
1848	621310	Offices of Chiropractors 
1849	62132	Offices of Optometrists
1850	621320	Offices of Optometrists
1851	62133	Offices of Mental Health Practitioners (except Physicians)
1852	621330	Offices of Mental Health Practitioners (except Physicians) 
1853	62134	Offices of Physical, Occupational and Speech Therapists, and Audiologists
1854	621340	Offices of Physical, Occupational and Speech Therapists, and Audiologists 
1855	62139	Offices of All Other Health Practitioners
1856	621391	Offices of Podiatrists 
1857	621399	Offices of All Other Miscellaneous Health Practitioners 
1858	6214	Outpatient Care Centers
1859	62141	Family Planning Centers
1860	621410	Family Planning Centers 
1861	62142	Outpatient Mental Health and Substance Abuse Centers
1862	621420	Outpatient Mental Health and Substance Abuse Centers 
1863	62149	Other Outpatient Care Centers
1864	621491	HMO Medical Centers 
1865	621492	Kidney Dialysis Centers 
1866	621493	Freestanding Ambulatory Surgical and Emergency Centers 
1867	621498	All Other Outpatient Care Centers 
1868	6215	Medical and Diagnostic Laboratories
1869	62151	Medical and Diagnostic Laboratories
1870	621511	Medical Laboratories 
1871	621512	Diagnostic Imaging Centers 
1872	6216	Home Health Care Services
1873	62161	Home Health Care Services
1874	621610	Home Health Care Services
1875	6219	Other Ambulatory Health Care Services
1876	62191	Ambulance Services
1877	621910	Ambulance Services 
1878	62199	All Other Ambulatory Health Care Services
1879	621991	Blood and Organ Banks 
1880	621999	All Other Miscellaneous Ambulatory Health Care Services 
1881	622	Hospitals
1882	6221	General Medical and Surgical Hospitals
1883	62211	General Medical and Surgical Hospitals
1884	622110	General Medical and Surgical Hospitals 
1885	6222	Psychiatric and Substance Abuse Hospitals
1886	62221	Psychiatric and Substance Abuse Hospitals
1887	622210	Psychiatric and Substance Abuse Hospitals 
1888	6223	Specialty (except Psychiatric and Substance Abuse) Hospitals
1889	62231	Specialty (except Psychiatric and Substance Abuse) Hospitals
1890	622310	Specialty (except Psychiatric and Substance Abuse) Hospitals 
1891	623	Nursing and Residential Care Facilities
1892	6231	Nursing Care Facilities (Skilled Nursing Facilities)
1893	62311	Nursing Care Facilities (Skilled Nursing Facilities)
1894	623110	Nursing Care Facilities (Skilled Nursing Facilities) 
1895	6232	Residential Intellectual and Developmental Disability, Mental Health, and Substance Abuse Facilities
1896	62321	Residential Intellectual and Developmental Disability Facilities
1897	623210	Residential Intellectual and Developmental Disability Facilities 
1898	62322	Residential Mental Health and Substance Abuse Facilities
1899	623220	Residential Mental Health and Substance Abuse Facilities 
1900	6233	Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly
1901	62331	Continuing Care Retirement Communities and Assisted Living Facilities for the Elderly
1902	623311	Continuing Care Retirement Communities 
1903	623312	Assisted Living Facilities for the Elderly 
1904	6239	Other Residential Care Facilities
1905	62399	Other Residential Care Facilities
1906	623990	Other Residential Care Facilities 
1907	624	Social Assistance
1908	6241	Individual and Family Services
1909	62411	Child and Youth Services
1910	624110	Child and Youth Services 
1911	62412	Services for the Elderly and Persons with Disabilities
1912	624120	Services for the Elderly and Persons with Disabilities 
1913	62419	Other Individual and Family Services
1914	624190	Other Individual and Family Services 
1915	6242	Community Food and Housing, and Emergency and Other Relief Services
1916	62421	Community Food Services
1917	624210	Community Food Services 
1918	62422	Community Housing Services
1919	624221	Temporary Shelters 
1920	624229	Other Community Housing Services 
1921	62423	Emergency and Other Relief Services
1922	624230	Emergency and Other Relief Services 
1923	6243	Vocational Rehabilitation Services
1924	62431	Vocational Rehabilitation Services
1925	624310	Vocational Rehabilitation Services 
1926	6244	Child Day Care Services
1927	62441	Child Day Care Services
1928	624410	Child Day Care Services 
1929	71	Arts, Entertainment, and Recreation
1930	711	Performing Arts, Spectator Sports, and Related Industries
1931	7111	Performing Arts Companies
1932	71111	Theater Companies and Dinner Theaters
1933	711110	Theater Companies and Dinner Theaters 
1934	71112	Dance Companies
1935	711120	Dance Companies 
1936	71113	Musical Groups and Artists
1937	711130	Musical Groups and Artists 
1938	71119	Other Performing Arts Companies
1939	711190	Other Performing Arts Companies 
1940	7112	Spectator Sports
1941	71121	Spectator Sports
1942	711211	Sports Teams and Clubs 
1943	711212	Racetracks 
1944	711219	Other Spectator Sports 
1945	7113	Promoters of Performing Arts, Sports, and Similar Events
1946	71131	Promoters of Performing Arts, Sports, and Similar Events with Facilities
1947	711310	Promoters of Performing Arts, Sports, and Similar Events with Facilities 
1948	71132	Promoters of Performing Arts, Sports, and Similar Events without Facilities
1949	711320	Promoters of Performing Arts, Sports, and Similar Events without Facilities 
1950	7114	Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures
1951	71141	Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures
1952	711410	Agents and Managers for Artists, Athletes, Entertainers, and Other Public Figures
1953	7115	Independent Artists, Writers, and Performers
1954	71151	Independent Artists, Writers, and Performers
1955	711510	Independent Artists, Writers, and Performers 
1956	712	Museums, Historical Sites, and Similar Institutions
1957	7121	Museums, Historical Sites, and Similar Institutions
1958	71211	Museums
1959	712110	Museums 
1960	71212	Historical Sites
1961	712120	Historical Sites
1962	71213	Zoos and Botanical Gardens
1963	712130	Zoos and Botanical Gardens 
1964	71219	Nature Parks and Other Similar Institutions
1965	712190	Nature Parks and Other Similar Institutions
1966	713	Amusement, Gambling, and Recreation Industries
1967	7131	Amusement Parks and Arcades
1968	71311	Amusement and Theme Parks
1969	713110	Amusement and Theme Parks 
1970	71312	Amusement Arcades
1971	713120	Amusement Arcades
1972	7132	Gambling Industries
1973	71321	Casinos (except Casino Hotels)
1974	713210	Casinos (except Casino Hotels)
1975	71329	Other Gambling Industries
1976	713290	Other Gambling Industries 
1977	7139	Other Amusement and Recreation Industries
1978	71391	Golf Courses and Country Clubs
1979	713910	Golf Courses and Country Clubs
1980	71392	Skiing Facilities
1981	713920	Skiing Facilities
1982	71393	Marinas
1983	713930	Marinas
1984	71394	Fitness and Recreational Sports Centers
1985	713940	Fitness and Recreational Sports Centers 
1986	71395	Bowling Centers
1987	713950	Bowling Centers
1988	71399	All Other Amusement and Recreation Industries
1989	713990	All Other Amusement and Recreation Industries 
1990	72	Accommodation and Food Services
1991	721	Accommodation
1992	7211	Traveler Accommodation
1993	72111	Hotels (except Casino Hotels) and Motels
1994	721110	Hotels (except Casino Hotels) and Motels 
1995	72112	Casino Hotels
1996	721120	Casino Hotels
1997	72119	Other Traveler Accommodation
1998	721191	Bed-and-Breakfast Inns 
1999	721199	All Other Traveler Accommodation 
2000	7212	RV (Recreational Vehicle) Parks and Recreational Camps
2001	72121	RV (Recreational Vehicle) Parks and Recreational Camps
2002	721211	RV (Recreational Vehicle) Parks and Campgrounds 
2003	721214	Recreational and Vacation Camps (except Campgrounds) 
2004	7213	Rooming and Boarding Houses, Dormitories, and Workers' Camps
2005	72131	Rooming and Boarding Houses, Dormitories, and Workers' Camps
2006	721310	Rooming and Boarding Houses, Dormitories, and Workers' Camps 
2007	722	Food Services and Drinking Places
2008	7223	Special Food Services
2009	72231	Food Service Contractors
2010	722310	Food Service Contractors
2011	72232	Caterers
2012	722320	Caterers
2013	72233	Mobile Food Services
2014	722330	Mobile Food Services
2015	7224	Drinking Places (Alcoholic Beverages)
2016	72241	Drinking Places (Alcoholic Beverages)
2017	722410	Drinking Places (Alcoholic Beverages) 
2018	7225	Restaurants and Other Eating Places
2019	72251	Restaurants and Other Eating Places
2020	722511	Full-Service Restaurants 
2021	722513	Limited-Service Restaurants 
2022	722514	Cafeterias, Grill Buffets, and Buffets 
2023	722515	Snack and Nonalcoholic Beverage Bars 
2024	81	Other Services (except Public Administration)
2025	811	Repair and Maintenance
2026	8111	Automotive Repair and Maintenance
2027	81111	Automotive Mechanical and Electrical Repair and Maintenance
2028	811111	General Automotive Repair 
2029	811112	Automotive Exhaust System Repair 
2030	811113	Automotive Transmission Repair 
2031	811118	Other Automotive Mechanical and Electrical Repair and Maintenance 
2032	81112	Automotive Body, Paint, Interior, and Glass Repair
2033	811121	Automotive Body, Paint, and Interior Repair and Maintenance 
2034	811122	Automotive Glass Replacement Shops 
2035	81119	Other Automotive Repair and Maintenance
2036	811191	Automotive Oil Change and Lubrication Shops 
2037	811192	Car Washes 
2038	811198	All Other Automotive Repair and Maintenance 
2039	8112	Electronic and Precision Equipment Repair and Maintenance
2040	81121	Electronic and Precision Equipment Repair and Maintenance
2041	811211	Consumer Electronics Repair and Maintenance 
2042	811212	Computer and Office Machine Repair and Maintenance 
2043	811213	Communication Equipment Repair and Maintenance 
2044	811219	Other Electronic and Precision Equipment Repair and Maintenance 
2045	8113	Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance
2046	81131	Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance
2047	811310	Commercial and Industrial Machinery and Equipment (except Automotive and Electronic) Repair and Maintenance 
2048	8114	Personal and Household Goods Repair and Maintenance
2049	81141	Home and Garden Equipment and Appliance Repair and Maintenance
2050	811411	Home and Garden Equipment Repair and Maintenance 
2051	811412	Appliance Repair and Maintenance 
2052	81142	Reupholstery and Furniture Repair
2053	811420	Reupholstery and Furniture Repair
2054	81143	Footwear and Leather Goods Repair
2055	811430	Footwear and Leather Goods Repair
2056	81149	Other Personal and Household Goods Repair and Maintenance
2057	811490	Other Personal and Household Goods Repair and Maintenance 
2058	812	Personal and Laundry Services
2059	8121	Personal Care Services 
2060	81211	Hair, Nail, and Skin Care Services 
2061	812111	Barber Shops 
2062	812112	Beauty Salons 
2063	812113	Nail Salons 
2064	81219	Other Personal Care Services 
2065	812191	Diet and Weight Reducing Centers 
2066	812199	Other Personal Care Services 
2067	8122	Death Care Services 
2068	81221	Funeral Homes and Funeral Services 
2069	812210	Funeral Homes and Funeral Services 
2070	81222	Cemeteries and Crematories 
2071	812220	Cemeteries and Crematories 
2072	8123	Drycleaning and Laundry Services 
2073	81231	Coin-Operated Laundries and Drycleaners 
2074	812310	Coin-Operated Laundries and Drycleaners 
2075	81232	Drycleaning and Laundry Services (except Coin-Operated) 
2076	812320	Drycleaning and Laundry Services (except Coin-Operated) 
2077	81233	Linen and Uniform Supply 
2078	812331	Linen Supply 
2079	812332	Industrial Launderers 
2080	8129	Other Personal Services 
2081	81291	Pet Care (except Veterinary) Services 
2082	812910	Pet Care (except Veterinary) Services 
2083	81292	Photofinishing 
2084	812921	Photofinishing Laboratories (except One-Hour) 
2085	812922	One-Hour Photofinishing 
2086	81293	Parking Lots and Garages 
2087	812930	Parking Lots and Garages 
2088	81299	All Other Personal Services 
2089	812990	All Other Personal Services 
2090	813	Religious, Grantmaking, Civic, Professional, and Similar Organizations
2091	8131	Religious Organizations 
2092	81311	Religious Organizations 
2093	813110	Religious Organizations 
2094	8132	Grantmaking and Giving Services 
2095	81321	Grantmaking and Giving Services 
2096	813211	Grantmaking Foundations 
2097	813212	Voluntary Health Organizations 
2098	813219	Other Grantmaking and Giving Services 
2099	8133	Social Advocacy Organizations 
2100	81331	Social Advocacy Organizations 
2101	813311	Human Rights Organizations 
2102	813312	Environment, Conservation and Wildlife Organizations 
2103	813319	Other Social Advocacy Organizations 
2104	8134	Civic and Social Organizations 
2105	81341	Civic and Social Organizations 
2106	813410	Civic and Social Organizations 
2107	8139	Business, Professional, Labor, Political, and Similar Organizations 
2108	81391	Business Associations 
2109	813910	Business Associations 
2110	81392	Professional Organizations 
2111	813920	Professional Organizations 
2112	81393	Labor Unions and Similar Labor Organizations 
2113	813930	Labor Unions and Similar Labor Organizations 
2114	81394	Political Organizations 
2115	813940	Political Organizations 
2116	81399	Other Similar Organizations (except Business, Professional, Labor, and Political Organizations) 
2117	813990	Other Similar Organizations (except Business, Professional, Labor, and Political Organizations) 
2118	814	Private Households
2119	8141	Private Households
2120	81411	Private Households
2121	814110	Private Households
2122	92	Public Administration
2123	921	Executive, Legislative, and Other General Government Support 
2124	9211	Executive, Legislative, and Other General Government Support 
2125	92111	Executive Offices 
2126	921110	Executive Offices 
2127	92112	Legislative Bodies 
2128	921120	Legislative Bodies 
2129	92113	Public Finance Activities 
2130	921130	Public Finance Activities 
2131	92114	Executive and Legislative Offices, Combined 
2132	921140	Executive and Legislative Offices, Combined 
2133	92115	American Indian and Alaska Native Tribal Governments 
2134	921150	American Indian and Alaska Native Tribal Governments 
2135	92119	Other General Government Support 
2136	921190	Other General Government Support 
2137	922	Justice, Public Order, and Safety Activities 
2138	9221	Justice, Public Order, and Safety Activities 
2139	92211	Courts 
2140	922110	Courts 
2141	92212	Police Protection 
2142	922120	Police Protection 
2143	92213	Legal Counsel and Prosecution 
2144	922130	Legal Counsel and Prosecution 
2145	92214	Correctional Institutions 
2146	922140	Correctional Institutions 
2147	92215	Parole Offices and Probation Offices 
2148	922150	Parole Offices and Probation Offices 
2149	92216	Fire Protection 
2150	922160	Fire Protection 
2151	92219	Other Justice, Public Order, and Safety Activities 
2152	922190	Other Justice, Public Order, and Safety Activities 
2153	923	Administration of Human Resource Programs 
2154	9231	Administration of Human Resource Programs 
2155	92311	Administration of Education Programs 
2156	923110	Administration of Education Programs 
2157	92312	Administration of Public Health Programs 
2158	923120	Administration of Public Health Programs 
2159	92313	Administration of Human Resource Programs (except Education, Public Health, and Veterans' Affairs Programs) 
2160	923130	Administration of Human Resource Programs (except Education, Public Health, and Veterans' Affairs Programs) 
2161	92314	Administration of Veterans' Affairs 
2162	923140	Administration of Veterans' Affairs 
2163	924	Administration of Environmental Quality Programs 
2164	9241	Administration of Environmental Quality Programs 
2165	92411	Administration of Air and Water Resource and Solid Waste Management Programs 
2166	924110	Administration of Air and Water Resource and Solid Waste Management Programs 
2167	92412	Administration of Conservation Programs 
2168	924120	Administration of Conservation Programs 
2169	925	Administration of Housing Programs, Urban Planning, and Community Development 
2170	9251	Administration of Housing Programs, Urban Planning, and Community Development 
2171	92511	Administration of Housing Programs 
2172	925110	Administration of Housing Programs 
2173	92512	Administration of Urban Planning and Community and Rural Development 
2174	925120	Administration of Urban Planning and Community and Rural Development 
2175	926	Administration of Economic Programs 
2176	9261	Administration of Economic Programs 
2177	92611	Administration of General Economic Programs 
2178	926110	Administration of General Economic Programs 
2179	92612	Regulation and Administration of Transportation Programs 
2180	926120	Regulation and Administration of Transportation Programs 
2181	92613	Regulation and Administration of Communications, Electric, Gas, and Other Utilities 
2182	926130	Regulation and Administration of Communications, Electric, Gas, and Other Utilities 
2183	92614	Regulation of Agricultural Marketing and Commodities 
2184	926140	Regulation of Agricultural Marketing and Commodities 
2185	92615	Regulation, Licensing, and Inspection of Miscellaneous Commercial Sectors 
2186	926150	Regulation, Licensing, and Inspection of Miscellaneous Commercial Sectors 
2187	927	Space Research and Technology 
2188	9271	Space Research and Technology 
2189	92711	Space Research and Technology 
2190	927110	Space Research and Technology 
2191	928	National Security and International Affairs 
2192	9281	National Security and International Affairs 
2193	92811	National Security 
2194	928110	National Security 
2195	92812	International Affairs 
2196	928120	International Affairs 
\.


--
-- Name: naics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stephen
--

SELECT pg_catalog.setval('naics_id_seq', 2196, true);


--
-- Name: naics naics_pkey; Type: CONSTRAINT; Schema: public; Owner: stephen
--

ALTER TABLE ONLY naics
    ADD CONSTRAINT naics_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

