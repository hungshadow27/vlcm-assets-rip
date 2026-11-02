package com.tgame.moudels.bowArrow.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import flash.utils.IDataInput;
   
   public class BowArrowItemInfo
   {
      
      public var curtID:int;
      
      public var id:int;
      
      public var name:String = LanResManager.getLanCommonTextWords("龙舌弓");
      
      public var step:int;
      
      public var historyDes:String = "";
      
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
      
      public var attributeDes:String = "";
      
      public var allArcheryList:Array = [];
      
      public var activeArcheryList:Array = [];
      
      public var bowArrowGoodsOne:Goods;
      
      public var bowArrowGoodsTwo:Goods;
      
      public var propertyDesList:Array = [];
      
      public var isUseArrow:Boolean;
      
      public var visible:Boolean;
      
      public var isJihuo:Boolean;
      
      public var dingJijinDu:int;
      
      public var addGongji:int;
      
      public var addFangyu:int;
      
      public var addShengming:int;
      
      public var times:int;
      
      public var isDanTian:Boolean;
      
      public var ynlianzhounu:Boolean;
      
      public function BowArrowItemInfo(param1:IDataInput, param2:Boolean = true)
      {
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:int = 0;
         var _loc7_:Skill = null;
         var _loc8_:String = null;
         var _loc9_:int = 0;
         super();
         if(param1)
         {
            this.curtID = param1.readInt();
            if(this.curtID == -1 && !param2)
            {
               return;
            }
            if(param2)
            {
               this.id = param1.readInt();
            }
            this.name = param1.readUTF();
            this.step = param1.readByte();
            this.historyDes = param1.readUTF();
            this.propertyDesList = [];
            this.atkAdd = param1.readInt();
            this.defAdd = param1.readInt();
            this.critical = param1.readInt();
            this.evasion = param1.readInt();
            this.hpUplimit = param1.readInt();
            this.interUpLimit = param1.readInt();
            this.stgUpLimit = param1.readInt();
            this.atkSpeed = param1.readInt();
            this.moveSpeed = param1.readInt();
            this.atkScale = param1.readInt();
            this.defScale = param1.readInt();
            _loc3_ = param1.readInt();
            this.allArcheryList = [];
            this.activeArcheryList = [];
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = uint(param1.readInt());
               _loc6_ = param1.readByte();
               _loc7_ = new Skill(_loc5_);
               _loc7_.isLearn = _loc6_;
               _loc7_.level = 1;
               _loc7_.isGongJian = 1;
               this.allArcheryList.push(_loc7_);
               if(_loc6_)
               {
                  this.activeArcheryList.push(_loc5_);
               }
               _loc4_++;
            }
            this.bowArrowGoodsOne = new Goods(param1.readInt());
            this.bowArrowGoodsOne.count = param1.readInt();
            this.bowArrowGoodsOne.bind = param1.readByte();
            this.bowArrowGoodsTwo = new Goods(param1.readInt());
            this.bowArrowGoodsTwo.count = param1.readInt();
            this.bowArrowGoodsTwo.bind = param1.readByte();
            this.isUseArrow = Boolean(param1.readByte());
            this.visible = Boolean(param1.readByte());
            this.isJihuo = param1.readByte() == 1;
            this.dingJijinDu = param1.readInt();
            this.addGongji = param1.readInt();
            this.addFangyu = param1.readInt();
            this.addShengming = param1.readInt();
            this.times = param1.readByte();
            this.isDanTian = Boolean(param1.readByte());
            this.ynlianzhounu = Boolean(param1.readByte());
            if(this.atkAdd > 0)
            {
               _loc8_ = "";
               if(this.times > 0)
               {
                  _loc8_ = "x" + String(this.times);
               }
               _loc9_ = 1;
               while(_loc9_ <= 10 - String(this.atkAdd).length)
               {
                  _loc8_ = " " + _loc8_;
                  _loc9_++;
               }
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"增加攻击",[this.atkAdd]) + _loc8_);
            }
            if(this.defAdd > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"增加防御",[this.defAdd]));
            }
            if(this.critical > 0)
            {
               _loc8_ = "";
               if(this.times > 0)
               {
                  _loc8_ = "x" + String(this.times);
               }
               _loc9_ = 1;
               while(_loc9_ <= 10 - String(this.critical).length)
               {
                  _loc8_ = " " + _loc8_;
                  _loc9_++;
               }
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"增加暴击",[this.critical]) + _loc8_);
            }
            if(this.evasion > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"增加闪避",[this.evasion]));
            }
            if(this.hpUplimit > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"生命上限",[this.hpUplimit]));
            }
            if(this.interUpLimit > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"内力上限",[this.interUpLimit]));
            }
            if(this.stgUpLimit > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"体力上限",[this.stgUpLimit]));
            }
            if(this.atkSpeed > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"攻击速度",[this.atkSpeed]));
            }
            if(this.moveSpeed > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"移动速度",[this.moveSpeed]));
            }
            if(this.atkScale > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"攻击增强比例",[this.atkScale]));
            }
            if(this.defScale > 0)
            {
               this.propertyDesList.push(LanResManager.getLanTextWords(this,"忽视防御比例",[this.defScale]));
            }
         }
      }
   }
}

