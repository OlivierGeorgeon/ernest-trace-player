PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE obsels (trace_id VARCHAR, o_date FLOAT, o_data BLOB);
INSERT INTO "obsels" VALUES('10',0.0,'<slice date="0">
<event date="0" id="1" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>0</satisfaction>
<direction>90</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>14</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>FF0000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<clock>0</clock>
<activation_context_acts/>
<learn_count>0</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',1.0,'<slice date="1">
<event date="1" id="2" source="environment">
<type>position</type>
<x>2</x>
<y>7</y>
<orientation>0</orientation>
</event>
<event date="1" id="3" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>-|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>100</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>1</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-|)</act>
</activation_context_acts>
<learn_count>0</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',2.0,'<slice date="2">
<event date="2" id="4" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>0</orientation>
</event>
<event date="2" id="5" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>00E6A1</pixel_0_3>
<pixel_0_2>00E6A1</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>00E6A1</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>25</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>42</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>2</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|-)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',3.0,'<slice date="3">
<event date="3" id="6" source="environment">
<type>position</type>
<x>2</x>
<y>5</y>
<orientation>0</orientation>
</event>
<event date="3" id="7" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>75</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>53</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>3</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',4.0,'<slice date="4">
<event date="4" id="8" source="environment">
<type>position</type>
<x>2</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="4" id="9" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<bundle>
<color>008000</color>
<tactile>2</tactile>
</bundle>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>25</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>4</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',5.0,'<slice date="5">
<event date="5" id="10" source="environment">
<type>position</type>
<x>2</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="5" id="11" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>25</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>FF0000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>5</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',6.0,'<slice date="6">
<event date="6" id="12" source="environment">
<type>position</type>
<x>2</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="6" id="13" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>25</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>FF0000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>6</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',7.0,'<slice date="7">
<event date="7" id="14" source="environment">
<type>position</type>
<x>2</x>
<y>4</y>
<orientation>35</orientation>
</event>
<event date="7" id="15" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>1000</distance>
<attractiveness>60</attractiveness>
<span>12</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>7</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',8.0,'<slice date="8">
<event date="8" id="16" source="environment">
<type>position</type>
<x>1</x>
<y>3</y>
<orientation>35</orientation>
</event>
<event date="8" id="17" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>8</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',9.0,'<slice date="9">
<event date="9" id="18" source="environment">
<type>position</type>
<x>1</x>
<y>3</y>
<orientation>30</orientation>
</event>
<event date="9" id="19" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>10</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>9</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|-)</primitive_enacted_act>
<activation_context_acts>
<act>(^|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',10.0,'<slice date="10">
<event date="10" id="20" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>30</orientation>
</event>
<event date="10" id="21" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>30</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>10</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',11.0,'<slice date="11">
<event date="11" id="22" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>30</orientation>
</event>
<event date="11" id="23" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>30</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>FF0000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>11</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=10 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',12.0,'<slice date="12">
<event date="12" id="24" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>25</orientation>
</event>
<event date="12" id="25" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<bundle>
<color>000000</color>
<tactile>2</tactile>
</bundle>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>000000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>12</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',13.0,'<slice date="13">
<event date="13" id="26" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>25</orientation>
</event>
<event date="13" id="27" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>20</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>FF0000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>13</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=1" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=20 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',14.0,'<slice date="14">
<event date="14" id="28" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>20</orientation>
</event>
<event date="14" id="29" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>65</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>41</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>14</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=40 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',15.0,'<slice date="15">
<event date="15" id="30" source="environment">
<type>position</type>
<x>0</x>
<y>4</y>
<orientation>20</orientation>
</event>
<event date="15" id="31" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>65</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>15</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',16.0,'<slice date="16">
<event date="16" id="32" source="environment">
<type>position</type>
<x>0</x>
<y>5</y>
<orientation>20</orientation>
</event>
<event date="16" id="33" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>70</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>22</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>16</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',17.0,'<slice date="17">
<event date="17" id="34" source="environment">
<type>position</type>
<x>0</x>
<y>5</y>
<orientation>25</orientation>
</event>
<event date="17" id="35" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>20</direction>
<kinematic>5</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>000000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>17</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|*)</primitive_enacted_act>
<activation_context_acts>
<act>(v|*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',18.0,'<slice date="18">
<event date="18" id="36" source="environment">
<type>position</type>
<x>0</x>
<y>5</y>
<orientation>25</orientation>
</event>
<event date="18" id="37" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>20</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>FF0000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>18</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=2" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=30 e=3 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',19.0,'<slice date="19">
<event date="19" id="38" source="environment">
<type>position</type>
<x>0</x>
<y>5</y>
<orientation>20</orientation>
</event>
<event date="19" id="39" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>70</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>22</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>19</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=1" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=60 e=2 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',20.0,'<slice date="20">
<event date="20" id="40" source="environment">
<type>position</type>
<x>0</x>
<y>6</y>
<orientation>20</orientation>
</event>
<event date="20" id="41" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>85</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>14</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>20</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',21.0,'<slice date="21">
<event date="21" id="42" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>20</orientation>
</event>
<event date="21" id="43" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>-|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>95</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>21</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;-|)(&gt;|-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',22.0,'<slice date="22">
<event date="22" id="44" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>15</orientation>
</event>
<event date="22" id="45" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>80</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>235</attractiveness>
<span>7</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>22</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=1" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=100 e=3 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',23.0,'<slice date="23">
<event date="23" id="46" source="environment">
<type>position</type>
<x>1</x>
<y>8</y>
<orientation>15</orientation>
</event>
<event date="23" id="47" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>20</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>23</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;|*)[&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',24.0,'<slice date="24">
<event date="24" id="48" source="environment">
<type>position</type>
<x>1</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="24" id="49" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>100</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>24</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',25.0,'<slice date="25">
<event date="25" id="50" source="environment">
<type>position</type>
<x>2</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="25" id="51" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>60</attractiveness>
<span>12</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>25</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',26.0,'<slice date="26">
<event date="26" id="52" source="environment">
<type>position</type>
<x>3</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="26" id="53" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>60</attractiveness>
<span>12</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>26</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=40 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',27.0,'<slice date="27">
<event date="27" id="54" source="environment">
<type>position</type>
<x>4</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="27" id="55" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>20</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>27</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;|*)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;|*)(^+|) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=10 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',28.0,'<slice date="28">
<event date="28" id="56" source="environment">
<type>position</type>
<x>4</x>
<y>8</y>
<orientation>5</orientation>
</event>
<event date="28" id="57" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>15</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>28</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',29.0,'<slice date="29">
<event date="29" id="58" source="environment">
<type>position</type>
<x>4</x>
<y>8</y>
<orientation>0</orientation>
</event>
<event date="29" id="59" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>105</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>29</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',30.0,'<slice date="30">
<event date="30" id="60" source="environment">
<type>position</type>
<x>4</x>
<y>8</y>
<orientation>35</orientation>
</event>
<event date="30" id="61" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>75</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>008000</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>30</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=1" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=1" s=40</activation>
<activation>"(^+)(&gt;|*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=20 e=4 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',31.0,'<slice date="31">
<event date="31" id="62" source="environment">
<type>position</type>
<x>3</x>
<y>7</y>
<orientation>35</orientation>
</event>
<event date="31" id="63" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>85</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>31</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+|)(&gt;-|) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',32.0,'<slice date="32">
<event date="32" id="64" source="environment">
<type>position</type>
<x>3</x>
<y>7</y>
<orientation>30</orientation>
</event>
<event date="32" id="65" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>32</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=1" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=60 e=5 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',33.0,'<slice date="33">
<event date="33" id="66" source="environment">
<type>position</type>
<x>2</x>
<y>7</y>
<orientation>30</orientation>
</event>
<event date="33" id="67" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>E6CF00</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<bundle>
<color>E6CF00</color>
<tactile>1</tactile>
</bundle>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>230</attractiveness>
<span>6</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>E6CF00</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>33</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=1" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',34.0,'<slice date="34">
<event date="34" id="68" source="environment">
<type>position</type>
<x>1</x>
<y>7</y>
<orientation>30</orientation>
</event>
<event date="34" id="69" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>1</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>5</direction>
<kinematic>0</kinematic>
<gustatory>3</gustatory>
<distance>70</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>34</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;|-)(&gt;+) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=40 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',35.0,'<slice date="35">
<event date="35" id="70" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>30</orientation>
</event>
<event date="35" id="71" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>30</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>35</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;*)[&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',36.0,'<slice date="36">
<event date="36" id="72" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>25</orientation>
</event>
<event date="36" id="73" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>E6CF00</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>36</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=10 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',37.0,'<slice date="37">
<event date="37" id="74" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>20</orientation>
</event>
<event date="37" id="75" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>35</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>1000</distance>
<attractiveness>40</attractiveness>
<span>8</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>E6CF00</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>37</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=100 e=6 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',38.0,'<slice date="38">
<event date="38" id="76" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>20</orientation>
</event>
<event date="38" id="77" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>20</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>38</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|*)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;|*)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;|*)(^+|) w=1" s=10</activation>
<activation>"(&gt;|*)(^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=20 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',39.0,'<slice date="39">
<event date="39" id="78" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>15</orientation>
</event>
<event date="39" id="79" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>15</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>000000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>39</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=1" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=20 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',40.0,'<slice date="40">
<event date="40" id="80" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="40" id="81" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>110</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>80</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>40</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=1" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=60 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',41.0,'<slice date="41">
<event date="41" id="82" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>5</orientation>
</event>
<event date="41" id="83" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>85</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>80</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>B4B4B4</position_4>
<position_3>E6CF00</position_3>
<position_2>B4B4B4</position_2>
<position_1>000000</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>41</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=1" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=70 e=3 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',42.0,'<slice date="42">
<event date="42" id="84" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>0</orientation>
</event>
<event date="42" id="85" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>E6CF00</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>1</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>80</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>E6CF00</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>42</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-50 e=8 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',43.0,'<slice date="43">
<event date="43" id="86" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>35</orientation>
</event>
<event date="43" id="87" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>45</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>E6CF00</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>43</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<activation_context_acts>
<act>(^*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',44.0,'<slice date="44">
<event date="44" id="88" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>35</orientation>
</event>
<event date="44" id="89" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>45</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>FF0000</position_3>
<position_2>B4B4B4</position_2>
<position_1>E6CF00</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>44</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=3" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=40 e=4 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',45.0,'<slice date="45">
<event date="45" id="90" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>30</orientation>
</event>
<event date="45" id="91" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>E6CF00</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>45</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<activation_context_acts>
<act>(^*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',46.0,'<slice date="46">
<event date="46" id="92" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>25</orientation>
</event>
<event date="46" id="93" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>30</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>46</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*)</primitive_enacted_act>
<activation_context_acts>
<act>(^*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',47.0,'<slice date="47">
<event date="47" id="94" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>25</orientation>
</event>
<event date="47" id="95" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>30</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>FF0000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>47</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=3" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
<activation>"[&gt;](^*|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-70 e=5 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',48.0,'<slice date="48">
<event date="48" id="96" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>30</orientation>
</event>
<event date="48" id="97" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>_|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>40</direction>
<kinematic>5</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>008000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>48</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v_|)</primitive_enacted_act>
<activation_context_acts>
<act>(v_|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',49.0,'<slice date="49">
<event date="49" id="98" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>30</orientation>
</event>
<event date="49" id="99" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>40</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>008000</position_4>
<position_3>FF0000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>49</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=3" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
<activation>"[&gt;](^*|) w=1" s=-110</activation>
<activation>"[&gt;](v_|) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-70 e=5 s=-10</proposal>
<proposal>"v w=1000" w=10 e=1 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',50.0,'<slice date="50">
<event date="50" id="100" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>35</orientation>
</event>
<event date="50" id="101" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>_|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>45</direction>
<kinematic>5</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>008000</position_5>
<position_4>008000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>50</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v_|)</primitive_enacted_act>
<activation_context_acts>
<act>(v_|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(v_|)[&gt;] w=1" s=-100</activation>
<activation>"(v_|)([&gt;](v_|)) w=1" s=-90</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',51.0,'<slice date="51">
<event date="51" id="102" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>30</orientation>
</event>
<event date="51" id="103" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>008000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>51</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<activation_context_acts>
<act>(^*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
<activation>"(^*|)(^*) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',52.0,'<slice date="52">
<event date="52" id="104" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>35</orientation>
</event>
<event date="52" id="105" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>_|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>45</direction>
<kinematic>5</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>008000</position_5>
<position_4>008000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>52</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v_|)</primitive_enacted_act>
<activation_context_acts>
<act>(v_|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v_|)[&gt;] w=1" s=-100</activation>
<activation>"(v_|)([&gt;](v_|)) w=1" s=-90</activation>
<activation>"(v_|)(^*|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',53.0,'<slice date="53">
<event date="53" id="106" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>0</orientation>
</event>
<event date="53" id="107" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>E6CF00</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>1</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>80</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>008000</position_6>
<position_5>008000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>646464</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>53</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',54.0,'<slice date="54">
<event date="54" id="108" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>0</orientation>
</event>
<event date="54" id="109" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>54</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=1" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-40 e=2 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',55.0,'<slice date="55">
<event date="55" id="110" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>35</orientation>
</event>
<event date="55" id="111" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>55</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<activation_context_acts>
<act>(^*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
<activation>"(^*|)(^*) w=1" s=-110</activation>
<activation>"(^*|)(v_|) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=10 e=1 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',56.0,'<slice date="56">
<event date="56" id="112" source="environment">
<type>position</type>
<x>0</x>
<y>7</y>
<orientation>0</orientation>
</event>
<event date="56" id="113" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>56</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=20 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',57.0,'<slice date="57">
<event date="57" id="114" source="environment">
<type>position</type>
<x>0</x>
<y>6</y>
<orientation>0</orientation>
</event>
<event date="57" id="115" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>60</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>57</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=1" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-40 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',58.0,'<slice date="58">
<event date="58" id="116" source="environment">
<type>position</type>
<x>0</x>
<y>6</y>
<orientation>5</orientation>
</event>
<event date="58" id="117" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>-|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>85</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>60</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>58</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v-|)</primitive_enacted_act>
<activation_context_acts>
<act>(v-|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',59.0,'<slice date="59">
<event date="59" id="118" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>5</orientation>
</event>
<event date="59" id="119" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>-|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>95</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>59</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;-|)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;-|)(^+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=10 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',60.0,'<slice date="60">
<event date="60" id="120" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>0</orientation>
</event>
<event date="60" id="121" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>65</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>60</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-50 e=8 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',61.0,'<slice date="61">
<event date="61" id="122" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>5</orientation>
</event>
<event date="61" id="123" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>-|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>95</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>61</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v-|)</primitive_enacted_act>
<activation_context_acts>
<act>(v-|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v-|)(&gt;-|) w=1" s=-80</activation>
<activation>"(v-|)((&gt;-|)(^+)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-150 e=2 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',62.0,'<slice date="62">
<event date="62" id="124" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>0</orientation>
</event>
<event date="62" id="125" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>65</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>62</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=1" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-50 e=8 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',63.0,'<slice date="63">
<event date="63" id="126" source="environment">
<type>position</type>
<x>1</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="63" id="127" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>65</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>41</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>63</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=1" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-40 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',64.0,'<slice date="64">
<event date="64" id="128" source="environment">
<type>position</type>
<x>1</x>
<y>3</y>
<orientation>0</orientation>
</event>
<event date="64" id="129" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>70</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>64</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=1" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-160 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',65.0,'<slice date="65">
<event date="65" id="130" source="environment">
<type>position</type>
<x>1</x>
<y>3</y>
<orientation>35</orientation>
</event>
<event date="65" id="131" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>-10</satisfaction>
<direction>40</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>31</distance>
<attractiveness>215</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>65</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^)</primitive_enacted_act>
<activation_context_acts>
<act>(^)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',66.0,'<slice date="66">
<event date="66" id="132" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>35</orientation>
</event>
<event date="66" id="133" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>66</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',67.0,'<slice date="67">
<event date="67" id="134" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>35</orientation>
</event>
<event date="67" id="135" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature/>
<satisfaction>-100</satisfaction>
<direction>40</direction>
<kinematic>1</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>FF0000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>67</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>[&gt;]</primitive_enacted_act>
<activation_context_acts>
<act>[&gt;]</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"[&gt;][&gt;] w=1" s=-100</activation>
<activation>"[&gt;](^+) w=3" s=10</activation>
<activation>"[&gt;](^|_) w=1" s=10</activation>
<activation>"[&gt;](^*|) w=1" s=-110</activation>
<activation>"[&gt;](v_|) w=2" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-70 e=5 s=-10</proposal>
<proposal>"v w=1000" w=20 e=2 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',68.0,'<slice date="68">
<event date="68" id="136" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>0</orientation>
</event>
<event date="68" id="137" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>9680FF</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>68</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=2" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=40 e=2 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',69.0,'<slice date="69">
<event date="69" id="138" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>0</orientation>
</event>
<event date="69" id="139" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>B8E600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<bundle>
<color>2EE600</color>
<tactile>1</tactile>
</bundle>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>60</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>235</attractiveness>
<span>7</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>2EE600</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>69</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=1" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-160 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-120 e=2 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',70.0,'<slice date="70">
<event date="70" id="140" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>5</orientation>
</event>
<event date="70" id="141" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>B8E600</pixel_0_3>
<pixel_0_2>9680FF</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>9680FF</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>20</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>100</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>2EE600</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>70</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|-)</primitive_enacted_act>
<activation_context_acts>
<act>(v|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',71.0,'<slice date="71">
<event date="71" id="142" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>5</orientation>
</event>
<event date="71" id="143" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>9680FF</pixel_0_3>
<pixel_0_2>B8E600</pixel_0_2>
<pixel_0_1>B8E600</pixel_0_1>
<pixel_0_0>00E6A1</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>646464</position_6>
<position_5>2EE600</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>71</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;*|)[&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',72.0,'<slice date="72">
<event date="72" id="144" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>0</orientation>
</event>
<event date="72" id="145" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>9680FF</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>30</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>2EE600</position_4>
<position_3>000000</position_3>
<position_2>000000</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>72</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*)</primitive_enacted_act>
<activation_context_acts>
<act>(^*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^*)[&gt;] w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',73.0,'<slice date="73">
<event date="73" id="146" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>35</orientation>
</event>
<event date="73" id="147" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>000000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>73</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=2" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=30 e=3 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',74.0,'<slice date="74">
<event date="74" id="148" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>30</orientation>
</event>
<event date="74" id="149" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>110</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>2EE600</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>74</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=2" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=1" s=10</activation>
<activation>"(^+|)((^+|)(^+)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=100 e=5 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',75.0,'<slice date="75">
<event date="75" id="150" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>25</orientation>
</event>
<event date="75" id="151" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>1</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>85</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>2EE600</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>75</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=2" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=2" s=10</activation>
<activation>"(^+|)((^+|)(^+)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=110 e=6 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',76.0,'<slice date="76">
<event date="76" id="152" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>20</orientation>
</event>
<event date="76" id="153" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>B8E600</pixel_0_11>
<pixel_0_10>B8E600</pixel_0_10>
<pixel_0_9>00E6A1</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>2EE600</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>76</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>0</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=2" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=1" s=60</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=30 e=10 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',77.0,'<slice date="77">
<event date="77" id="154" source="environment">
<type>position</type>
<x>1</x>
<y>1</y>
<orientation>20</orientation>
</event>
<event date="77" id="155" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>9680FF</pixel_0_11>
<pixel_0_10>00E6A1</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>60</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>77</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=2" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',78.0,'<slice date="78">
<event date="78" id="156" source="environment">
<type>position</type>
<x>1</x>
<y>2</y>
<orientation>20</orientation>
</event>
<event date="78" id="157" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>9680FF</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>78</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=2" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=20 e=4 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',79.0,'<slice date="79">
<event date="79" id="158" source="environment">
<type>position</type>
<x>1</x>
<y>3</y>
<orientation>20</orientation>
</event>
<event date="79" id="159" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>40</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>79</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=2" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=2" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=80 e=6 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',80.0,'<slice date="80">
<event date="80" id="160" source="environment">
<type>position</type>
<x>1</x>
<y>4</y>
<orientation>20</orientation>
</event>
<event date="80" id="161" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>30</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>80</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=2" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=3" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=2" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=140 e=8 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',81.0,'<slice date="81">
<event date="81" id="162" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>20</orientation>
</event>
<event date="81" id="163" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>81</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=1" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-160 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-120 e=2 s=-10</proposal>
<proposal>"v w=1000" w=-220 e=2 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',82.0,'<slice date="82">
<event date="82" id="164" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>15</orientation>
</event>
<event date="82" id="165" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>E6CF00</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>25</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>82</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|-)</primitive_enacted_act>
<activation_context_acts>
<act>(^|-)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^|-)(&gt;*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',83.0,'<slice date="83">
<event date="83" id="166" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>10</orientation>
</event>
<event date="83" id="167" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>5</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>83</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|-)</primitive_enacted_act>
<activation_context_acts>
<act>(^|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|-)(&gt;*) w=1" s=-80</activation>
<activation>"(^|-)(^|-) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',84.0,'<slice date="84">
<event date="84" id="168" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>15</orientation>
</event>
<event date="84" id="169" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>E6CF00</pixel_0_3>
<pixel_0_2>E6CF00</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>|+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>25</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>84</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|+)</primitive_enacted_act>
<activation_context_acts>
<act>(v|+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',85.0,'<slice date="85">
<event date="85" id="170" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>15</orientation>
</event>
<event date="85" id="171" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>00E6A1</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>E6CF00</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>1</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>5</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>14</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>646464</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>85</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;|-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;|-)(&gt;+) w=1" s=40</activation>
<activation>"(&gt;|-)(&gt;*) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-40 e=2 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',86.0,'<slice date="86">
<event date="86" id="172" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>10</orientation>
</event>
<event date="86" id="173" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>00E6A1</pixel_0_9>
<pixel_0_8>00E6A1</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>1</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>00E6A1</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>85</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>42</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>646464</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>86</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=3" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=2" s=10</activation>
<activation>"(^+|)((^+|)(^+)) w=2" s=20</activation>
<activation>"(^+|)((^+)(&gt;)) w=1" s=30</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=170 e=9 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',87.0,'<slice date="87">
<event date="87" id="174" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>5</orientation>
</event>
<event date="87" id="175" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>00E6A1</pixel_0_6>
<pixel_0_5>00E6A1</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>00E6A1</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>42</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>87</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=3" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=1" s=60</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=50 e=11 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',88.0,'<slice date="88">
<event date="88" id="176" source="environment">
<type>position</type>
<x>3</x>
<y>5</y>
<orientation>5</orientation>
</event>
<event date="88" id="177" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>00E6A1</pixel_0_6>
<pixel_0_5>00E6A1</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>00E6A1</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>28</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>88</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=3" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=3" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=2" s=40</activation>
<activation>"(&gt;)((&gt;)(&gt;+)) w=1" s=60</activation>
<activation>"(&gt;)((&gt;+)(^|-)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=240 e=10 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',89.0,'<slice date="89">
<event date="89" id="178" source="environment">
<type>position</type>
<x>4</x>
<y>4</y>
<orientation>5</orientation>
</event>
<event date="89" id="179" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>00E6A1</pixel_0_6>
<pixel_0_5>00E6A1</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<bundle>
<color>00E6A1</color>
<tactile>2</tactile>
</bundle>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>30</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>00E6A1</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>89</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;*)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;*)(^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=10 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',90.0,'<slice date="90">
<event date="90" id="180" source="environment">
<type>position</type>
<x>4</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="90" id="181" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>00E6A1</pixel_0_3>
<pixel_0_2>00E6A1</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>00E6A1</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>90</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=3" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
<activation>"(^|_)((^+|)(^+|)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=60 e=5 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',91.0,'<slice date="91">
<event date="91" id="182" source="environment">
<type>position</type>
<x>4</x>
<y>4</y>
<orientation>35</orientation>
</event>
<event date="91" id="183" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>00E6A1</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>15</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>00E6A1</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>91</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=3" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
<activation>"(^|_)((^+|)(^+|)) w=1" s=20</activation>
<activation>"(^|_)(^|_) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=70 e=6 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',92.0,'<slice date="92">
<event date="92" id="184" source="environment">
<type>position</type>
<x>4</x>
<y>4</y>
<orientation>30</orientation>
</event>
<event date="92" id="185" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>85</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>42</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>00E6A1</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>92</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=4" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=2" s=10</activation>
<activation>"(^+|)((^+|)(^+)) w=2" s=20</activation>
<activation>"(^+|)((^+)(&gt;)) w=2" s=30</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=210 e=11 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',93.0,'<slice date="93">
<event date="93" id="186" source="environment">
<type>position</type>
<x>4</x>
<y>4</y>
<orientation>25</orientation>
</event>
<event date="93" id="187" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>42</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>93</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=4" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=1" s=60</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=70 e=12 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',94.0,'<slice date="94">
<event date="94" id="188" source="environment">
<type>position</type>
<x>3</x>
<y>5</y>
<orientation>25</orientation>
</event>
<event date="94" id="189" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>28</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>94</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=3" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=3" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=2" s=40</activation>
<activation>"(&gt;)((&gt;)(&gt;+)) w=1" s=60</activation>
<activation>"(&gt;)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(&gt;)(&gt;*) w=1" s=-80</activation>
<activation>"(&gt;)((&gt;*)(^|_)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=90 e=12 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',95.0,'<slice date="95">
<event date="95" id="190" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>25</orientation>
</event>
<event date="95" id="191" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>E6CF00</pixel_0_6>
<pixel_0_5>E6CF00</pixel_0_5>
<pixel_0_4>E6CF00</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>14</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>E6CF00</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>95</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=2" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-160 e=2 s=20</proposal>
<proposal>"^ w=1000" w=-230 e=3 s=-10</proposal>
<proposal>"v w=1000" w=-220 e=2 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',96.0,'<slice date="96">
<event date="96" id="192" source="environment">
<type>position</type>
<x>1</x>
<y>7</y>
<orientation>25</orientation>
</event>
<event date="96" id="193" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>1</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>3</gustatory>
<distance>1000</distance>
<attractiveness>60</attractiveness>
<span>12</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>96</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;-)(&gt;) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=20 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',97.0,'<slice date="97">
<event date="97" id="194" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>25</orientation>
</event>
<event date="97" id="195" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>30</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>97</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;*)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;*)(^|_) w=2" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=20 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',98.0,'<slice date="98">
<event date="98" id="196" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>20</orientation>
</event>
<event date="98" id="197" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>5</span>
<local_map>
<position_6>E6CF00</position_6>
<position_5>B4B4B4</position_5>
<position_4>000000</position_4>
<position_3>008000</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>98</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=4" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
<activation>"(^|_)((^+|)(^+|)) w=1" s=20</activation>
<activation>"(^|_)(^|_) w=1" s=10</activation>
<activation>"(^|_)((^|_)(^+|)) w=1" s=20</activation>
<activation>"(^|_)((^+|)(^+)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=120 e=9 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',99.0,'<slice date="99">
<event date="99" id="198" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>15</orientation>
</event>
<event date="99" id="199" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|_</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>15</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>4</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>E6CF00</position_5>
<position_4>B4B4B4</position_4>
<position_3>000000</position_3>
<position_2>008000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>99</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|_)</primitive_enacted_act>
<activation_context_acts>
<act>(^|_)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|_)[&gt;] w=1" s=-100</activation>
<activation>"(^|_)([&gt;](^+)) w=1" s=-90</activation>
<activation>"(^|_)(^+|) w=4" s=10</activation>
<activation>"(^|_)(^+) w=1" s=10</activation>
<activation>"(^|_)((^+)(&gt;|*)) w=1" s=-70</activation>
<activation>"(^|_)((^+|)(^+|)) w=1" s=20</activation>
<activation>"(^|_)(^|_) w=2" s=10</activation>
<activation>"(^|_)((^|_)(^+|)) w=1" s=20</activation>
<activation>"(^|_)((^+|)(^+)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=130 e=10 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',100.0,'<slice date="100">
<event date="100" id="200" source="environment">
<type>position</type>
<x>0</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="100" id="201" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>30</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>35</attractiveness>
<span>7</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>E6CF00</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>100</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=2" s=40</activation>
<activation>"(^+)(&gt;) w=5" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=2" s=60</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=150 e=14 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',101.0,'<slice date="101">
<event date="101" id="202" source="environment">
<type>position</type>
<x>1</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="101" id="203" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>56</distance>
<attractiveness>45</attractiveness>
<span>9</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>E6CF00</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>101</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=2" s=-110</activation>
<activation>"(&gt;+)(v|*) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-240 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-230 e=3 s=-10</proposal>
<proposal>"v w=1000" w=-220 e=2 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',102.0,'<slice date="102">
<event date="102" id="204" source="environment">
<type>position</type>
<x>1</x>
<y>8</y>
<orientation>15</orientation>
</event>
<event date="102" id="205" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>|*</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>20</direction>
<kinematic>5</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>E6CF00</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>008000</position_3>
<position_2>000000</position_2>
<position_1>000000</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>102</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|*)</primitive_enacted_act>
<activation_context_acts>
<act>(v|*)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(v|*)[&gt;] w=1" s=-100</activation>
<activation>"(v|*)([&gt;](^+)) w=1" s=-90</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-190 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',103.0,'<slice date="103">
<event date="103" id="206" source="environment">
<type>position</type>
<x>1</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="103" id="207" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>40</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>56</distance>
<attractiveness>45</attractiveness>
<span>9</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>E6CF00</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>008000</position_2>
<position_1>000000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>103</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=3" s=40</activation>
<activation>"(^+)(&gt;) w=5" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=2" s=60</activation>
<activation>"(^+)((&gt;+)(v|*)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=190 e=15 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',104.0,'<slice date="104">
<event date="104" id="208" source="environment">
<type>position</type>
<x>2</x>
<y>8</y>
<orientation>10</orientation>
</event>
<event date="104" id="209" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>2</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>008000</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>60</attractiveness>
<span>12</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>000000</position_2>
<position_1>008000</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>104</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=2" s=-110</activation>
<activation>"(&gt;+)(v|*) w=2" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-240 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-230 e=3 s=-10</proposal>
<proposal>"v w=1000" w=-330 e=3 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',105.0,'<slice date="105">
<event date="105" id="210" source="environment">
<type>position</type>
<x>2</x>
<y>8</y>
<orientation>5</orientation>
</event>
<event date="105" id="211" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>2</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+|</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>95</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>82</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>000000</position_1>
<position_0>008000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>105</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+|)</primitive_enacted_act>
<activation_context_acts>
<act>(^+|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^+|)(&gt;-) w=1" s=-80</activation>
<activation>"(^+|)(^+) w=5" s=10</activation>
<activation>"(^+|)((^+)(&gt;+|)) w=1" s=50</activation>
<activation>"(^+|)(^+|) w=2" s=10</activation>
<activation>"(^+|)((^+|)(^+)) w=2" s=20</activation>
<activation>"(^+|)((^+)(&gt;)) w=3" s=30</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=250 e=13 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',106.0,'<slice date="106">
<event date="106" id="212" source="environment">
<type>position</type>
<x>2</x>
<y>8</y>
<orientation>0</orientation>
</event>
<event date="106" id="213" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>65</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>82</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>106</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^+)</primitive_enacted_act>
<activation_context_acts>
<act>(^+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^+)(&gt;+) w=4" s=40</activation>
<activation>"(^+)(&gt;) w=5" s=20</activation>
<activation>"(^+)(&gt;+|) w=2" s=40</activation>
<activation>"(^+)(&gt;|*) w=2" s=-80</activation>
<activation>"(^+)((&gt;|*)(^|_)) w=1" s=-70</activation>
<activation>"(^+)(^*|) w=1" s=-110</activation>
<activation>"(^+)(v-|) w=1" s=-110</activation>
<activation>"(^+)((&gt;)(&gt;+)) w=2" s=60</activation>
<activation>"(^+)((&gt;+)(v|*)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=230 e=16 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',107.0,'<slice date="107">
<event date="107" id="214" source="environment">
<type>position</type>
<x>2</x>
<y>7</y>
<orientation>0</orientation>
</event>
<event date="107" id="215" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>65</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>72</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>107</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>1</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=4" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=3" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=2" s=40</activation>
<activation>"(&gt;)((&gt;)(&gt;+)) w=1" s=60</activation>
<activation>"(&gt;)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(&gt;)(&gt;*) w=1" s=-80</activation>
<activation>"(&gt;)((&gt;*)(^|_)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=130 e=13 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',108.0,'<slice date="108">
<event date="108" id="216" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>0</orientation>
</event>
<event date="108" id="217" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>00E6A1</pixel_0_3>
<pixel_0_2>00E6A1</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>-</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>70</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>63</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>646464</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>108</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;-)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;-)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;-)(&gt;) w=1" s=20</activation>
<activation>"(&gt;-)(&gt;*) w=1" s=-80</activation>
<activation>"(&gt;-)((&gt;*)(^|_)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-130 e=3 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',109.0,'<slice date="109">
<event date="109" id="218" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>35</orientation>
</event>
<event date="109" id="219" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>00E6A1</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>-10</satisfaction>
<direction>40</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>63</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>109</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^)</primitive_enacted_act>
<activation_context_acts>
<act>(^)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^)(&gt;*|) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',110.0,'<slice date="110">
<event date="110" id="220" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>30</orientation>
</event>
<event date="110" id="221" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>E6CF00</pixel_0_9>
<pixel_0_8>E6CF00</pixel_0_8>
<pixel_0_7>E6CF00</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>10</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>63</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>646464</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>110</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|-)</primitive_enacted_act>
<activation_context_acts>
<act>(^|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(^|-)(&gt;*) w=1" s=-80</activation>
<activation>"(^|-)(^|-) w=1" s=-110</activation>
<activation>"(^|-)(v|+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=10 e=1 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',111.0,'<slice date="111">
<event date="111" id="222" source="environment">
<type>position</type>
<x>2</x>
<y>6</y>
<orientation>35</orientation>
</event>
<event date="111" id="223" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>00E6A1</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>40</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>63</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>646464</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>111</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=2" s=20</activation>
<activation>"(v+)(&gt;+) w=1" s=40</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=80 e=3 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',112.0,'<slice date="112">
<event date="112" id="224" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>35</orientation>
</event>
<event date="112" id="225" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>35</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>112</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=2" s=-110</activation>
<activation>"(&gt;+)(v|*) w=2" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;-) w=1" s=-80</activation>
<activation>"(&gt;+)(^+|) w=1" s=10</activation>
<activation>"(&gt;+)((^+|)(^+)) w=1" s=20</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-240 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-220 e=4 s=-10</proposal>
<proposal>"v w=1000" w=-330 e=3 s=-10</proposal>
<proposal>"(^+|)(^+) w=6" w=20 e=1 s=20</proposal>
</proposals>
<top_intention>((^+|)(^+))</top_intention>
<top_level>2</top_level>
<prescribed_intention>(^+|)</prescribed_intention>
<prescribed_intention>(^+|)</prescribed_intention>
<next_primitive_intention>(^+|)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',113.0,'<slice date="113">
<event date="113" id="226" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>30</orientation>
</event>
<event date="113" id="227" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>E6CF00</pixel_0_11>
<pixel_0_10>E6CF00</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>5</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>113</clock>
<primitive_intended_act>(^+|)</primitive_intended_act>
<primitive_enacted_act>(^|-)</primitive_enacted_act>
<intention_incorrect>(^+|)</intention_incorrect>
<activation_context_acts>
<act>(^|-)</act>
<act>[(^+|)(^+)]</act>
</activation_context_acts>
<learn_count>5</learn_count>
<activations display="no">
<activation>"(^|-)(&gt;*) w=1" s=-80</activation>
<activation>"(^|-)(^|-) w=1" s=-110</activation>
<activation>"(^|-)(v|+) w=1" s=10</activation>
<activation>"(^|-)(v+) w=1" s=10</activation>
<activation>"(^|-)((v+)(&gt;+)) w=1" s=50</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=70 e=3 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',114.0,'<slice date="114">
<event date="114" id="228" source="environment">
<type>position</type>
<x>1</x>
<y>5</y>
<orientation>35</orientation>
</event>
<event date="114" id="229" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>0</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>35</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>50</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>B4B4B4</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>114</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>4</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=2" s=20</activation>
<activation>"(v+)(&gt;+) w=2" s=40</activation>
<activation>"(v+)((&gt;+)(^|-)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=120 e=4 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',115.0,'<slice date="115">
<event date="115" id="230" source="environment">
<type>position</type>
<x>0</x>
<y>4</y>
<orientation>35</orientation>
</event>
<event date="115" id="231" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>115</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;*|)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;*|)(^*) w=1" s=-110</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',116.0,'<slice date="116">
<event date="116" id="232" source="environment">
<type>position</type>
<x>0</x>
<y>4</y>
<orientation>0</orientation>
</event>
<event date="116" id="233" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>40</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>116</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=2" s=20</activation>
<activation>"(v+)(&gt;+) w=2" s=40</activation>
<activation>"(v+)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(v+)(&gt;*|) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=40 e=5 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',117.0,'<slice date="117">
<event date="117" id="234" source="environment">
<type>position</type>
<x>0</x>
<y>3</y>
<orientation>0</orientation>
</event>
<event date="117" id="235" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature/>
<satisfaction>20</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>30</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>117</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;)(&gt;+) w=4" s=40</activation>
<activation>"(&gt;)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;)(^*|) w=1" s=-110</activation>
<activation>"(&gt;)(v-|) w=1" s=-110</activation>
<activation>"(&gt;)(&gt;) w=3" s=20</activation>
<activation>"(&gt;)((&gt;)(&gt;)) w=2" s=40</activation>
<activation>"(&gt;)((&gt;)(&gt;+)) w=1" s=60</activation>
<activation>"(&gt;)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(&gt;)(&gt;*) w=1" s=-80</activation>
<activation>"(&gt;)((&gt;*)(^|_)) w=1" s=-70</activation>
<activation>"(&gt;)(&gt;-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=50 e=14 s=20</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=-110 e=1 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',118.0,'<slice date="118">
<event date="118" id="236" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>0</orientation>
</event>
<event date="118" id="237" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>9680FF</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>55</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>118</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=3" s=-110</activation>
<activation>"(&gt;+)(v|*) w=2" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;-) w=1" s=-80</activation>
<activation>"(&gt;+)(^+|) w=1" s=10</activation>
<activation>"(&gt;+)((^+|)(^+)) w=1" s=20</activation>
<activation>"(&gt;+)[(^+|)(^+)] w=1" s=-110</activation>
<activation>"(&gt;+)((^|-)(v+)) w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-240 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-430 e=6 s=-10</proposal>
<proposal>"v w=1000" w=-330 e=3 s=-10</proposal>
<proposal>"(^+|)(^+) w=6" w=-90 e=0 s=20</proposal>
</proposals>
<top_intention>((^+|)(^+))</top_intention>
<top_level>2</top_level>
<prescribed_intention>(^+|)</prescribed_intention>
<prescribed_intention>(^+|)</prescribed_intention>
<next_primitive_intention>(^+|)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',119.0,'<slice date="119">
<event date="119" id="238" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>35</orientation>
</event>
<event date="119" id="239" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>119</clock>
<primitive_intended_act>(^+|)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<intention_incorrect>(^+|)</intention_incorrect>
<activation_context_acts>
<act>(^*|)</act>
<act>[(^+|)(^+)]</act>
</activation_context_acts>
<learn_count>5</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
<activation>"(^*|)(^*) w=1" s=-110</activation>
<activation>"(^*|)(v_|) w=1" s=10</activation>
<activation>"(^*|)(v+) w=1" s=10</activation>
<activation>"(^*|)((v+)(&gt;)) w=1" s=30</activation>
<activation>"[(^+|)(^+)](v+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=60 e=4 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',120.0,'<slice date="120">
<event date="120" id="240" source="environment">
<type>position</type>
<x>0</x>
<y>2</y>
<orientation>0</orientation>
</event>
<event date="120" id="241" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>9680FF</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>55</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>20</distance>
<attractiveness>220</attractiveness>
<span>4</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>120</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=3" s=20</activation>
<activation>"(v+)(&gt;+) w=2" s=40</activation>
<activation>"(v+)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(v+)(&gt;*|) w=1" s=-80</activation>
<activation>"(v+)((&gt;)(&gt;+)) w=1" s=60</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=120 e=7 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',121.0,'<slice date="121">
<event date="121" id="242" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>0</orientation>
</event>
<event date="121" id="243" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>B8E600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>2EE600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>40</satisfaction>
<direction>60</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>10</distance>
<attractiveness>235</attractiveness>
<span>7</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>2EE600</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>121</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;+)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;+)</act>
</activation_context_acts>
<learn_count>5</learn_count>
<activations display="no">
<activation>"(&gt;+)(&gt;|*) w=1" s=-80</activation>
<activation>"(&gt;+)(^|-) w=3" s=-110</activation>
<activation>"(&gt;+)(v|*) w=2" s=-110</activation>
<activation>"(&gt;+)(&gt;|-) w=1" s=-80</activation>
<activation>"(&gt;+)(^) w=1" s=-10</activation>
<activation>"(&gt;+)(v|-) w=1" s=-110</activation>
<activation>"(&gt;+)(&gt;-) w=1" s=-80</activation>
<activation>"(&gt;+)(^+|) w=1" s=10</activation>
<activation>"(&gt;+)((^+|)(^+)) w=1" s=20</activation>
<activation>"(&gt;+)[(^+|)(^+)] w=2" s=-110</activation>
<activation>"(&gt;+)((^|-)(v+)) w=1" s=-100</activation>
<activation>"(&gt;+)(^*|) w=1" s=-110</activation>
<activation>"(&gt;+)((^*|)(v+)) w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-240 e=3 s=20</proposal>
<proposal>"^ w=1000" w=-640 e=8 s=-10</proposal>
<proposal>"v w=1000" w=-330 e=3 s=-10</proposal>
<proposal>"(^+|)(^+) w=6" w=-200 e=-1 s=-110</proposal>
</proposals>
<top_intention>[(^+|)(^+)]</top_intention>
<top_level>2</top_level>
<prescribed_intention>(^+|)</prescribed_intention>
<prescribed_intention>(^+|)</prescribed_intention>
<next_primitive_intention>(^+|)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',122.0,'<slice date="122">
<event date="122" id="244" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>35</orientation>
</event>
<event date="122" id="245" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>1</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>2EE600</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>122</clock>
<primitive_intended_act>(^+|)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<intention_incorrect>(^+|)</intention_incorrect>
<activation_context_acts>
<act>(^*|)</act>
<act>[(^+|)(^+)]</act>
</activation_context_acts>
<learn_count>7</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
<activation>"(^*|)(^*) w=1" s=-110</activation>
<activation>"(^*|)(v_|) w=1" s=10</activation>
<activation>"(^*|)(v+) w=2" s=10</activation>
<activation>"(^*|)((v+)(&gt;)) w=1" s=30</activation>
<activation>"[(^+|)(^+)](v+) w=2" s=10</activation>
<activation>"(^*|)((v+)(&gt;+)) w=1" s=50</activation>
<activation>"[(^+|)(^+)]((v+)(&gt;+)) w=1" s=50</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=180 e=8 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',123.0,'<slice date="123">
<event date="123" id="246" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>0</orientation>
</event>
<event date="123" id="247" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>B8E600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>B8E600</color>
<dynamic_feature>|+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>0</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>2EE600</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>123</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|+)</primitive_enacted_act>
<activation_context_acts>
<act>(v|+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(v|+)(&gt;|-) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',124.0,'<slice date="124">
<event date="124" id="248" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>35</orientation>
</event>
<event date="124" id="249" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>2EE600</pixel_0_2>
<pixel_0_1>2EE600</pixel_0_1>
<pixel_0_0>2EE600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>1</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>0</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>40</direction>
<kinematic>3</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>B4B4B4</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>2EE600</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>124</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^*|)</primitive_enacted_act>
<activation_context_acts>
<act>(^*|)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(^*|)[&gt;] w=1" s=-100</activation>
<activation>"(^*|)(^*) w=1" s=-110</activation>
<activation>"(^*|)(v_|) w=1" s=10</activation>
<activation>"(^*|)(v+) w=2" s=10</activation>
<activation>"(^*|)((v+)(&gt;)) w=1" s=30</activation>
<activation>"(^*|)((v+)(&gt;+)) w=1" s=50</activation>
<activation>"(^*|)(v|+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=120 e=6 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',125.0,'<slice date="125">
<event date="125" id="250" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>0</orientation>
</event>
<event date="125" id="251" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>2EE600</pixel_0_5>
<pixel_0_4>2EE600</pixel_0_4>
<pixel_0_3>2EE600</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>B8E600</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>1</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>B8E600</color>
<dynamic_feature>|+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>0</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>70</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>2EE600</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>125</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|+)</primitive_enacted_act>
<activation_context_acts>
<act>(v|+)</act>
</activation_context_acts>
<learn_count>4</learn_count>
<activations display="no">
<activation>"(v|+)(&gt;|-) w=1" s=-80</activation>
<activation>"(v|+)(^*|) w=1" s=-110</activation>
<activation>"(v|+)((^*|)(v|+)) w=1" s=-100</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-210 e=2 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',126.0,'<slice date="126">
<event date="126" id="252" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>5</orientation>
</event>
<event date="126" id="253" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>B8E600</pixel_0_3>
<pixel_0_2>9680FF</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>9680FF</color>
<dynamic_feature>|+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>100</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>2EE600</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>126</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|+)</primitive_enacted_act>
<activation_context_acts>
<act>(v|+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v|+)(&gt;|-) w=1" s=-80</activation>
<activation>"(v|+)(^*|) w=1" s=-110</activation>
<activation>"(v|+)((^*|)(v|+)) w=1" s=-100</activation>
<activation>"(v|+)(v|+) w=1" s=10</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=-210 e=2 s=-10</proposal>
<proposal>"v w=1000" w=10 e=1 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',127.0,'<slice date="127">
<event date="127" id="254" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>10</orientation>
</event>
<event date="127" id="255" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>B8E600</pixel_0_6>
<pixel_0_5>9680FF</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>008000</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>0</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>1</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>2</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>E6CF00</color>
<dynamic_feature>|-</dynamic_feature>
<satisfaction>-110</satisfaction>
<direction>0</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>60</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>2EE600</position_5>
<position_4>B4B4B4</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>000000</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>127</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v|-)</primitive_enacted_act>
<activation_context_acts>
<act>(v|-)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(v|-)(&gt;*|) w=1" s=-80</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-80 e=1 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(^)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(^)</prescribed_intention>
<next_primitive_intention>(^)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',128.0,'<slice date="128">
<event date="128" id="256" source="environment">
<type>position</type>
<x>0</x>
<y>1</y>
<orientation>5</orientation>
</event>
<event date="128" id="257" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>2EE600</pixel_0_11>
<pixel_0_10>2EE600</pixel_0_10>
<pixel_0_9>2EE600</pixel_0_9>
<pixel_0_8>2EE600</pixel_0_8>
<pixel_0_7>2EE600</pixel_0_7>
<pixel_0_6>2EE600</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>B8E600</pixel_0_3>
<pixel_0_2>9680FF</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>008000</pixel_0_0>
</retina>
<tactile>
<cell_0_0>1</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>2</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>9680FF</color>
<dynamic_feature>|+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>20</direction>
<kinematic>2</kinematic>
<gustatory>0</gustatory>
<distance>100</distance>
<attractiveness>205</attractiveness>
<span>1</span>
<local_map>
<position_6>000000</position_6>
<position_5>000000</position_5>
<position_4>2EE600</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>^</primitive_enacted_schema>
<clock>128</clock>
<primitive_intended_act>(^)</primitive_intended_act>
<primitive_enacted_act>(^|+)</primitive_enacted_act>
<activation_context_acts>
<act>(^|+)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no"/>
<proposals display="no">
<proposal>"&gt; w=1000" w=0 e=0 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',129.0,'<slice date="129">
<event date="129" id="258" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>5</orientation>
</event>
<event date="129" id="259" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>008000</pixel_0_6>
<pixel_0_5>008000</pixel_0_5>
<pixel_0_4>008000</pixel_0_4>
<pixel_0_3>9680FF</pixel_0_3>
<pixel_0_2>B8E600</pixel_0_2>
<pixel_0_1>B8E600</pixel_0_1>
<pixel_0_0>00E6A1</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>2</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>1</cell_0_2>
<cell_1_2>0</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>000000</color>
<dynamic_feature>*|</dynamic_feature>
<satisfaction>-80</satisfaction>
<direction>40</direction>
<kinematic>0</kinematic>
<gustatory>0</gustatory>
<distance>0</distance>
<attractiveness>-600</attractiveness>
<span>3</span>
<local_map>
<position_6>646464</position_6>
<position_5>2EE600</position_5>
<position_4>000000</position_4>
<position_3>000000</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>&gt;</primitive_enacted_schema>
<clock>129</clock>
<primitive_intended_act>(&gt;)</primitive_intended_act>
<primitive_enacted_act>(&gt;*|)</primitive_enacted_act>
<activation_context_acts>
<act>(&gt;*|)</act>
</activation_context_acts>
<learn_count>2</learn_count>
<activations display="no">
<activation>"(&gt;*|)[&gt;] w=1" s=-100</activation>
<activation>"(&gt;*|)(^*) w=1" s=-110</activation>
<activation>"(&gt;*|)(v+) w=1" s=10</activation>
<activation>"(&gt;*|)((v+)(&gt;)) w=1" s=30</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=-100 e=-1 s=-100</proposal>
<proposal>"^ w=1000" w=-110 e=1 s=-10</proposal>
<proposal>"v w=1000" w=40 e=2 s=-10</proposal>
</proposals>
<top_intention>(v)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(v)</prescribed_intention>
<next_primitive_intention>(v)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',130.0,'<slice date="130">
<event date="130" id="260" source="environment">
<type>position</type>
<x>1</x>
<y>0</y>
<orientation>10</orientation>
</event>
<event date="130" id="261" source="Ernest">
<type>action</type>
<retina>
<pixel_0_11>008000</pixel_0_11>
<pixel_0_10>008000</pixel_0_10>
<pixel_0_9>008000</pixel_0_9>
<pixel_0_8>008000</pixel_0_8>
<pixel_0_7>008000</pixel_0_7>
<pixel_0_6>9680FF</pixel_0_6>
<pixel_0_5>B8E600</pixel_0_5>
<pixel_0_4>B8E600</pixel_0_4>
<pixel_0_3>00E6A1</pixel_0_3>
<pixel_0_2>008000</pixel_0_2>
<pixel_0_1>008000</pixel_0_1>
<pixel_0_0>E6CF00</pixel_0_0>
</retina>
<tactile>
<cell_0_0>2</cell_0_0>
<cell_1_0>0</cell_1_0>
<cell_2_0>0</cell_2_0>
<cell_0_1>2</cell_0_1>
<cell_1_1>0</cell_1_1>
<cell_2_1>0</cell_2_1>
<cell_0_2>2</cell_0_2>
<cell_1_2>1</cell_1_2>
<cell_2_2>0</cell_2_2>
</tactile>
<circadian>0</circadian>
<current_observation>
<color>B8E600</color>
<dynamic_feature>+</dynamic_feature>
<satisfaction>10</satisfaction>
<direction>45</direction>
<kinematic>4</kinematic>
<gustatory>0</gustatory>
<distance>60</distance>
<attractiveness>210</attractiveness>
<span>2</span>
<local_map>
<position_6>2EE600</position_6>
<position_5>000000</position_5>
<position_4>000000</position_4>
<position_3>B4B4B4</position_3>
<position_2>B4B4B4</position_2>
<position_1>B4B4B4</position_1>
<position_0>B4B4B4</position_0>
</local_map>
</current_observation>
<primitive_enacted_schema>v</primitive_enacted_schema>
<clock>130</clock>
<primitive_intended_act>(v)</primitive_intended_act>
<primitive_enacted_act>(v+)</primitive_enacted_act>
<activation_context_acts>
<act>(v+)</act>
</activation_context_acts>
<learn_count>3</learn_count>
<activations display="no">
<activation>"(v+)(&gt;) w=3" s=20</activation>
<activation>"(v+)(&gt;+) w=3" s=40</activation>
<activation>"(v+)((&gt;+)(^|-)) w=1" s=-70</activation>
<activation>"(v+)(&gt;*|) w=1" s=-80</activation>
<activation>"(v+)((&gt;)(&gt;+)) w=1" s=60</activation>
<activation>"(v+)((&gt;+)[(^+|)(^+)]) w=1" s=-70</activation>
<activation>"(v+)((&gt;+)(^*|)) w=1" s=-70</activation>
</activations>
<proposals display="no">
<proposal>"&gt; w=1000" w=160 e=8 s=20</proposal>
<proposal>"^ w=1000" w=0 e=0 s=-10</proposal>
<proposal>"v w=1000" w=0 e=0 s=-10</proposal>
</proposals>
<top_intention>(&gt;)</top_intention>
<top_level>1</top_level>
<prescribed_intention>(&gt;)</prescribed_intention>
<next_primitive_intention>(&gt;)</next_primitive_intention>
</event>
</slice>
');
INSERT INTO "obsels" VALUES('10',9e999,'<eot/>');
CREATE INDEX 'index_obsels' ON 'obsels' ('trace_id', 'o_date');
COMMIT;
