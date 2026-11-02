package com.tgame.moudels.partyTask.model.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.map.MapTransManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   
   public class BiaoCheInfo
   {
      
      public var copper:int;
      
      public var type:int;
      
      public var bcID:int;
      
      public var label:String;
      
      public var nickName:String;
      
      public var enable:int;
      
      public var bcHP:int;
      
      public var bcHuiFu:int;
      
      public var bcSpeed:int;
      
      public var bcChenFa:int;
      
      public var line:Array;
      
      public var taskLv:int;
      
      public var taskCopper:int;
      
      public var taskGongXian:int;
      
      public var taskJLGongXian:int;
      
      public var taskJLExp:int;
      
      public var taskJLZhenQi:int;
      
      public var taskJLCopper:int;
      
      public var taskJLItem:Array;
      
      public var gradeUPCaiLao:Array;
      
      public var gradeCopper:int;
      
      public function BiaoCheInfo()
      {
         super();
      }
      
      public function setLine(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc2_:Array = param1.split(";");
         var _loc4_:int = int(_loc2_.length);
         this.line = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_[_loc3_] != "")
            {
               _loc6_ = _loc2_[_loc3_].split(",");
               _loc5_ = {};
               _loc5_.id = int(_loc6_[0]);
               _loc5_.label = MapTransManager.getSceneNameBySceneId(_loc5_.id);
               _loc5_.grade = int(_loc6_[1]);
               this.line.push(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function setItem(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:Array = null;
         var _loc2_:Array = param1.split(";");
         var _loc4_:int = int(_loc2_.length);
         this.taskJLItem = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_[_loc3_] != "")
            {
               _loc6_ = _loc2_[_loc3_].split(",");
               _loc5_ = new Goods(int(_loc6_[0]));
               _loc5_.count = int(_loc6_[1]);
               this.taskJLItem.push(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function setCaiLiao(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:Array = null;
         var _loc2_:Array = param1.split(";");
         var _loc4_:int = int(_loc2_.length);
         this.gradeUPCaiLao = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(_loc2_[_loc3_] != "")
            {
               _loc6_ = _loc2_[_loc3_].split(",");
               _loc5_ = new Goods(int(_loc6_[0]));
               _loc5_.count = int(_loc6_[1]);
               this.gradeUPCaiLao.push(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function getTaskLv() : String
      {
         var _loc1_:String = this.taskLv > GameInstance.mainCharData.attributeInfo.lv ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         return "<font color=\'" + _loc1_ + "\'>" + this.taskLv + "</font>";
      }
      
      public function getTaskCopper() : String
      {
         var _loc1_:String = this.taskCopper > this.copper ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         return "<font color=\'" + _loc1_ + "\'>" + this.taskCopper + "</font>";
      }
      
      public function getTaskGongXian() : String
      {
         var _loc1_:String = this.taskGongXian > GameInstance.mainCharData.banghuiInfo.banggong ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         return "<font color=\'" + _loc1_ + "\'>" + this.taskGongXian + "</font>";
      }
      
      public function getGradeUPCaiLao() : String
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc1_:String = "";
         var _loc2_:String = "";
         var _loc4_:int = int(this.gradeUPCaiLao.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this.gradeUPCaiLao[_loc3_] as Goods;
            _loc2_ += "<font color=\'" + _loc1_ + "\'>" + _loc5_.res.name + "*" + _loc5_.count + "</font>    ";
            _loc3_++;
         }
         return _loc2_ + (LanResManager.getLanCommonTextWords("铜币") + ":<font color=\'\'>" + this.gradeCopper + "</font>");
      }
   }
}

