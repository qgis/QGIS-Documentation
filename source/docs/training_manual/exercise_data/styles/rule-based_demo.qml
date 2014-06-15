<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="1.8.0-master" minimumScale="0" maximumScale="1e+08" hasScaleBasedVisibilityFlag="0">
  <transparencyLevelInt>255</transparencyLevelInt>
  <renderer-v2 symbollevels="0" type="RuleRenderer" firstrule="1">
    <rules>
      <rule scalemaxdenom="0" description="" filter="AREA >= 0.00085&#xa;" symbol="0" scalemindenom="0" label=""/>
      <rule scalemaxdenom="0" description="" filter="AREA &lt;= 0.00085" symbol="1" scalemindenom="0" label=""/>
      <rule scalemaxdenom="0" description="" filter="TOWN != 'Swellendam Rural'" symbol="2" scalemindenom="0" label=""/>
    </rules>
    <symbols>
      <symbol outputUnit="MM" alpha="1" type="fill" name="0">
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="255,85,0,255"/>
          <prop k="color_border" v="0,0,0,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="fill" name="1">
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="255,170,0,255"/>
          <prop k="color_border" v="0,0,0,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="0.4705882352941176" type="fill" name="2">
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="0,0,0,120"/>
          <prop k="color_border" v="0,0,0,120"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.26"/>
        </layer>
      </symbol>
      <symbol outputUnit="MM" alpha="1" type="fill" name="default">
        <layer pass="0" class="SimpleFill" locked="0">
          <prop k="color" v="164,229,252,255"/>
          <prop k="color_border" v="0,0,0,255"/>
          <prop k="offset" v="0,0"/>
          <prop k="style" v="solid"/>
          <prop k="style_border" v="solid"/>
          <prop k="width_border" v="0.26"/>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties/>
  <displayfield>AG_CAD_ID</displayfield>
  <label>0</label>
  <labelattributes>
    <label fieldname="" text="Label"/>
    <family fieldname="" name="Ubuntu"/>
    <size fieldname="" units="pt" value="12"/>
    <bold fieldname="" on="0"/>
    <italic fieldname="" on="0"/>
    <underline fieldname="" on="0"/>
    <strikeout fieldname="" on="0"/>
    <color fieldname="" red="0" blue="0" green="0"/>
    <x fieldname=""/>
    <y fieldname=""/>
    <offset x="0" y="0" units="pt" yfieldname="" xfieldname=""/>
    <angle fieldname="" value="0" auto="0"/>
    <alignment fieldname="" value="center"/>
    <buffercolor fieldname="" red="255" blue="255" green="255"/>
    <buffersize fieldname="" units="pt" value="1"/>
    <bufferenabled fieldname="" on=""/>
    <multilineenabled fieldname="" on=""/>
    <selectedonly on=""/>
  </labelattributes>
  <edittypes>
    <edittype type="0" name="AG_CAD_ID"/>
    <edittype type="0" name="AG_MUN_ID"/>
    <edittype type="0" name="AG_PROV_ID"/>
    <edittype type="0" name="AG_SGAD_ID"/>
    <edittype type="0" name="AG_SUB_CDE"/>
    <edittype type="0" name="AG_SUB_ID"/>
    <edittype type="0" name="AG_TOWN_ID"/>
    <edittype type="0" name="AREA"/>
    <edittype type="0" name="AREA_TABLE"/>
    <edittype type="0" name="FARM_NO"/>
    <edittype type="0" name="MAJ_REGION"/>
    <edittype type="0" name="MUNIC"/>
    <edittype type="0" name="PORTION"/>
    <edittype type="0" name="PROVINCE"/>
    <edittype type="0" name="SGADMIN"/>
    <edittype type="0" name="SG_CODE"/>
    <edittype type="0" name="SOURCE"/>
    <edittype type="0" name="SUBURB"/>
    <edittype type="0" name="TOWN"/>
    <edittype type="0" name="UPDATED"/>
    <edittype type="0" name="X"/>
    <edittype type="0" name="Y"/>
  </edittypes>
  <editform>.</editform>
  <editforminit></editforminit>
  <annotationform>.</annotationform>
  <attributeactions/>
</qgis>
