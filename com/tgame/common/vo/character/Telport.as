package com.tgame.common.vo.character
{
   import com.tgame.common.res.map.MapRes;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.res.map.TransOutRes;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.zcp.engine.SceneCharacter;
   
   public class Telport extends BaseCharacter
   {
      
      public var attributeInfo:AttributeInfo = new AttributeInfo();
      
      public var res:TransOutRes;
      
      public var targetMapRes:MapRes;
      
      public function Telport(param1:SceneCharacter, param2:TransOutRes)
      {
         super(param1);
         this.res = param2;
         this.targetMapRes = MapTransManager.getMapRes(this.res.mapID);
      }
   }
}

