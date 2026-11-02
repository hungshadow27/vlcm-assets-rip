package com.tgame.common.vo.character.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.MountQuality;
   import com.tgame.common.vo.item.Skill;
   
   public class MountAttributeInfo extends AttributeInfo
   {
      
      public var quality:int = 1;
      
      public var savvy:int = 1;
      
      public var identity:int = 1;
      
      public var superMountType:int = 0;
      
      public var bloodS:int = 0;
      
      public var ycsx:int = 0;
      
      public var menghuan:Number;
      
      public var menghuan_wuxing:Number;
      
      public var menghuan_jineng:Number;
      
      public var menghuan_qianli:Number;
      
      public var menghuan_mhd:int;
      
      public var menghuanShendanJihuo:Boolean;
      
      public var chaojizuoqiQianNengDan:int;
      
      public var zhongjizuoqiQianNengDan:int;
      
      public var shoushenDan:int;
      
      public var dianfengqiannengDan:int;
      
      public var shouwangzhihunJihuo:Boolean;
      
      public var isLong:Boolean;
      
      public var menghuan_append_hp:Number = 0;
      
      public var menghuan_append_mp:Number = 0;
      
      public var menghuan_append_pp:Number = 0;
      
      public var menghuan_append_ap:Number = 0;
      
      public var menghuan_append_dp:Number = 0;
      
      public var menghuan_append_cp:Number = 0;
      
      public var menghuan_append_ev:Number = 0;
      
      public var menghuan_append_adx:Number = 0;
      
      public var menghuan_append_mdx:Number = 0;
      
      public var energyNow:int;
      
      public var energyMax:int;
      
      public var fightNow:int;
      
      public var fightMax:int;
      
      public var points_attackNow:int = 0;
      
      public var points_attackMin:int = 0;
      
      public var points_attackMax:int = 0;
      
      public var points_attackFujia:int = 0;
      
      public var points_defenceNow:int = 0;
      
      public var points_defenceMin:int = 0;
      
      public var points_defenceMax:int = 0;
      
      public var points_defenceFujia:int = 0;
      
      public var points_flyNow:int = 0;
      
      public var points_flyMin:int = 0;
      
      public var points_flyMax:int = 0;
      
      public var points_flyFujia:int = 0;
      
      public var points_stongNow:int = 0;
      
      public var points_stongMin:int = 0;
      
      public var points_stongMax:int = 0;
      
      public var points_stongFujia:int = 0;
      
      public var append_hp:Number = 0;
      
      public var append_mp:Number = 0;
      
      public var append_pp:Number = 0;
      
      public var append_ap:Number = 0;
      
      public var append_dp:Number = 0;
      
      public var append_cp:Number = 0;
      
      public var append_ev:Number = 0;
      
      public var append_adx:Number = 0;
      
      public var append_mdx:Number = 0;
      
      public var superMpunt_hp:Number = 0;
      
      public var superMpunt_mp:Number = 0;
      
      public var superMpunt_pp:Number = 0;
      
      public var superMpunt_ap:Number = 0;
      
      public var superMpunt_dp:Number = 0;
      
      public var superMpunt_cp:Number = 0;
      
      public var superMpunt_ev:Number = 0;
      
      public var superMpunt_adx:int = 0;
      
      public var superMpunt_mdx:int = 0;
      
      public var zhufuzhi:Number = 0;
      
      public var mainSkillID:int;
      
      private var _mountZuheSkillArr:Array = [];
      
      public var nextMountName:String = "";
      
      public var nextMountZuhejiRL:int = 0;
      
      public var shouYuanCount:int = 0;
      
      public var souyuan_hp:Number = 0;
      
      public var souyuan_mp:Number = 0;
      
      public var souyuan_pp:Number = 0;
      
      public var souyuan_ap:Number = 0;
      
      public var souyuan_dp:Number = 0;
      
      public var souyuan_cp:Number = 0;
      
      public var souyuan_ev:Number = 0;
      
      public var souyuan_adx:int = 0;
      
      public var souyuan_mdx:int = 0;
      
      public var zw1:int = 0;
      
      public var zw2:int = 0;
      
      public var zw3:int = 0;
      
      public var zw4:int = 0;
      
      public function MountAttributeInfo()
      {
         super();
      }
      
      public function getQualityName(param1:String = "") : String
      {
         return MountQuality.getName(this.quality,param1);
      }
      
      public function setMountZuHeSkillArr(param1:String) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:int = 0;
         var _loc6_:Array = null;
         this._mountZuheSkillArr.length = 0;
         if(param1 == "")
         {
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc5_:int = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_].split(",");
            if(_loc6_.length != 1)
            {
               _loc3_ = new Skill(_loc6_[1],_loc6_[0]);
               _loc3_.isLearn = 1;
               this._mountZuheSkillArr.push(_loc3_);
            }
            _loc4_++;
         }
         this._mountZuheSkillArr.sortOn("position",Array.NUMERIC);
      }
      
      public function getMountZuHeSkillArr() : Array
      {
         var _loc1_:Skill = null;
         var _loc2_:Skill = null;
         for each(_loc1_ in this._mountZuheSkillArr)
         {
            _loc2_ = GameInstance.mainCharData.skillInfo.getSkillByID(_loc1_.id);
            _loc1_.level = _loc2_ ? _loc2_.level : 1;
            _loc1_.levelAppend = _loc2_ ? _loc2_.levelAppend : 0;
         }
         return this._mountZuheSkillArr;
      }
   }
}

