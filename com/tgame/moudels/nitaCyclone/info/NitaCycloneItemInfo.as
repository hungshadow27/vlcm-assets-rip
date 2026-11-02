package com.tgame.moudels.nitaCyclone.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.vo.item.Skill;
   import flash.utils.IDataInput;
   
   public class NitaCycloneItemInfo
   {
      
      public var curtID:int;
      
      public var id:int;
      
      public var schoolID:uint;
      
      public var isSelfPerforation:Boolean;
      
      public var wifeSchoolID:uint;
      
      public var wifeNitaID:uint;
      
      public var isWifePerforation:Boolean;
      
      public var atkAdd:int;
      
      public var defAdd:int;
      
      public var critical:int;
      
      public var evasion:int;
      
      public var hpUplimit:int;
      
      public var interUpLimit:int;
      
      public var stgUpLimit:int;
      
      public var atkSpeed:int;
      
      public var moveSpeed:int;
      
      public var atkScale:int;
      
      public var defScale:int;
      
      public var propertyDesList:Array = [];
      
      public var schoolCnt:int;
      
      public var schoolList:Array = [];
      
      public var jianghuCnt:int;
      
      public var jianghuList:Array = [];
      
      public var othersCnt:int;
      
      public var othersList:Array = [];
      
      public var skillList:Array = [];
      
      public var isJiHuo:Boolean = false;
      
      public var jinjie:int;
      
      public var jinjiePd:int;
      
      public var jinjieSkill:int;
      
      public var jinjieBtnStr:String;
      
      public var shouJinjie:int;
      
      public var jinjiePeio:int;
      
      public var dingJijinDu:int;
      
      public var addGongji:int;
      
      public var addFangyu:int;
      
      public var addShengming:int;
      
      public var xinFaSta:int = 0;
      
      public var isQichendantian:Boolean;
      
      public var jinglingDantian:Boolean;
      
      public var isShowYN:int = 0;
      
      public var isShowYN_tjly:Boolean = false;
      
      public var yn_tjly:Boolean = false;
      
      public var yn_sdxn:Boolean = false;
      
      public var isShowYN_sdxn:Boolean = false;
      
      public var isSelectYN:int = 0;
      
      public function NitaCycloneItemInfo(param1:IDataInput, param2:Boolean = true)
      {
         var _loc3_:uint = 0;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Skill = null;
         super();
         if(param1)
         {
            this.isJiHuo = param1.readByte() == 0 ? false : true;
            if(param2)
            {
               this.id = param1.readByte();
            }
            this.curtID = param1.readByte();
            if(this.curtID == -1 && !param2)
            {
               this.isJiHuo = false;
               return;
            }
            this.schoolID = param1.readByte();
            this.isSelfPerforation = Boolean(param1.readByte());
            this.wifeNitaID = param1.readByte();
            this.jinjiePeio = param1.readByte();
            this.wifeSchoolID = param1.readByte();
            this.isWifePerforation = Boolean(param1.readByte());
            this.propertyDesList = [];
            this.atkAdd = param1.readInt();
            if(this.atkAdd > 0)
            {
               this.propertyDesList.push(LanResManager.getLanCommonTextWords("攻击") + ":+" + [this.atkAdd]);
            }
            this.defAdd = param1.readInt();
            if(this.defAdd > 0)
            {
               this.propertyDesList.push(LanResManager.getLanCommonTextWords("防御") + ":+" + [this.defAdd]);
            }
            this.critical = param1.readInt();
            if(this.critical > 0)
            {
               this.propertyDesList.push(LanResManager.getLanCommonTextWords("暴击") + ":+" + [this.critical]);
            }
            this.evasion = param1.readInt();
            if(this.evasion > 0)
            {
               this.propertyDesList.push(LanResManager.getLanCommonTextWords("闪避") + ":+" + [this.evasion]);
            }
            this.hpUplimit = param1.readInt();
            if(this.hpUplimit > 0)
            {
               this.propertyDesList.push(LanResManager.getLanCommonTextWords("生命上限") + ":+" + [this.hpUplimit]);
            }
            _loc3_ = 0;
            _loc4_ = null;
            _loc5_ = [];
            this.schoolCnt = param1.readInt();
            this.schoolList = [];
            _loc4_ = param1.readUTF();
            if(_loc4_)
            {
               _loc5_ = _loc4_.split(";");
            }
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               this.schoolList.push(SkillResManager.getSkillRes(uint(_loc5_[_loc3_])).name);
               _loc3_++;
            }
            this.jianghuCnt = param1.readInt();
            this.jianghuList = [];
            if(_loc4_)
            {
               _loc4_ = param1.readUTF();
            }
            _loc5_ = _loc4_.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               this.jianghuList.push(SkillResManager.getSkillRes(uint(_loc5_[_loc3_])).name);
               _loc3_++;
            }
            this.othersCnt = param1.readInt();
            this.othersList = [];
            if(_loc4_)
            {
               _loc4_ = param1.readUTF();
            }
            _loc5_ = _loc4_.split(";");
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               this.othersList.push(SkillResManager.getSkillRes(uint(_loc5_[_loc3_])).name);
               _loc3_++;
            }
            _loc6_ = param1.readByte();
            _loc3_ = 0;
            while(_loc3_ < _loc6_)
            {
               _loc7_ = param1.readInt();
               _loc8_ = param1.readByte();
               _loc9_ = new Skill(_loc7_);
               _loc9_.isDanTian = 1;
               _loc9_.level = 1;
               _loc9_.isLearn = _loc8_;
               this.skillList.push(_loc9_);
               _loc3_++;
            }
            this.dingJijinDu = param1.readInt();
            this.addGongji = param1.readInt();
            this.addFangyu = param1.readInt();
            this.addShengming = param1.readInt();
            this.jinjie = param1.readByte();
            if(this.jinjie != 0)
            {
               this.jinjiePd = param1.readByte();
               this.jinjieSkill = param1.readInt();
               this.jinjieBtnStr = param1.readUTF();
            }
            if(this.curtID < 8)
            {
               this.shouJinjie = 2;
            }
            else if(this.curtID == 8)
            {
               if(this.jinjiePd == 0)
               {
                  this.shouJinjie = 1;
               }
               else
               {
                  this.shouJinjie = 3;
               }
            }
            this.xinFaSta = param1.readByte();
            this.isQichendantian = Boolean(param1.readByte() == 1);
            this.jinglingDantian = Boolean(param1.readByte());
            this.isShowYN_tjly = Boolean(param1.readByte() == 1);
            this.yn_tjly = Boolean(param1.readByte() == 1);
            this.isShowYN_sdxn = Boolean(param1.readByte() == 1);
            this.yn_sdxn = Boolean(param1.readByte() == 1);
            this.isShowYN = 1;
         }
      }
   }
}

