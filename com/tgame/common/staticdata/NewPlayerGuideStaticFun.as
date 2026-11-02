package com.tgame.common.staticdata
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.newPlayerGuide.NewPlayerGuideVO;
   import com.tgame.manager.ReloginManager;
   
   public class NewPlayerGuideStaticFun
   {
      
      public static var newPlayerGuideXML:XML;
      
      public static var sendMsg50563:Function;
      
      public static var guide9Goods:Goods;
      
      private static var jianTouGuide:JianTouGuide;
      
      private static var levelGuide:LevelGuide;
      
      private static var imageInstanceGuide:ImageInstanceGuide;
      
      public static var sendMsg50565:Function;
      
      public static var isOpenNewPlayerGuideMenu:Boolean = true;
      
      public static var levelGuideArr:Array = [];
      
      public static var waitAddAndShowOneNewPlayerGuideArr:Array = [];
      
      public static var isReceived50652:Boolean = false;
      
      public function NewPlayerGuideStaticFun()
      {
         super();
      }
      
      public static function parseNewPlayerRes(param1:Object) : void
      {
         newPlayerGuideXML = XML(param1);
         jianTouGuide = new JianTouGuide();
         levelGuide = new LevelGuide();
         imageInstanceGuide = new ImageInstanceGuide();
      }
      
      public static function setNewPlayerGuideObj(param1:int, param2:Boolean, param3:int, param4:int) : void
      {
         if(param1 == NewPlayerGuideType.JIAN_TOU_SHI_GUIDE)
         {
            jianTouGuide.setNewPlayerGuideObj(param2,param3,param4);
         }
      }
      
      public static function getNewPlayerGuideVO(param1:int) : NewPlayerGuideVO
      {
         return jianTouGuide.getNewPlayerGuideVO(param1);
      }
      
      public static function closeNewPlayerGuide(param1:int) : void
      {
         jianTouGuide.closeNewPlayerGuide(param1);
      }
      
      public static function addAndShowOneNewPlayerGuide(param1:int) : void
      {
         if(!isOpenNewPlayerGuideMenu)
         {
            return;
         }
         jianTouGuide.addAndShowOneNewPlayerGuide(param1);
      }
      
      public static function addImageInstanceGuide(param1:int, param2:Object = null) : void
      {
         if(!isOpenNewPlayerGuideMenu)
         {
            return;
         }
         if(ReloginManager.isInKuafu)
         {
            return;
         }
         if(!imageInstanceGuide)
         {
            imageInstanceGuide = new ImageInstanceGuide();
         }
         imageInstanceGuide.addImageInstanceGuide(param1,param2);
      }
      
      public static function removeAllImageInstanceGuide() : void
      {
         if(!imageInstanceGuide)
         {
            return;
         }
         imageInstanceGuide.removeAllImageInstanceGuide();
      }
      
      public static function newPlayerGuideImageLeadCanvasTipToNull(param1:*) : void
      {
         if(!isOpenNewPlayerGuideMenu)
         {
            return;
         }
         imageInstanceGuide.newPlayerGuideImageLeadCanvasTipToNull(param1);
      }
      
      public static function getNewPlayerGuideIsShowingAtStage(param1:int) : Boolean
      {
         if(!jianTouGuide)
         {
            return false;
         }
         return jianTouGuide.getNewPlayerGuideIsShowingAtStage(param1);
      }
   }
}

import com.tgame.common.GameInstance;
import com.tgame.common.res.task.TaskRes;
import com.tgame.common.res.task.TaskResManager;
import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
import com.tgame.common.staticdata.NewPlayerGuideType;
import com.tgame.common.ui.componets.LeadArrowTip;
import com.tgame.common.ui.componets.OptionTip;
import com.tgame.common.vo.character.info.data.CharTaskData;
import com.tgame.common.vo.item.Goods;
import com.tgame.common.vo.item.Skill;
import com.tgame.common.vo.newPlayerGuide.NewPlayerGuideVO;
import com.tgame.shell.view.components.MainUI;

class ImageInstanceGuide
{
   
   private var outTaskIDArr:Array = [];
   
   private var bookGoods:Goods;
   
   private var taskRes:TaskRes;
   
   private var tempGood:Goods;
   
   private var newPlayerGuideObj:Object;
   
   private var newPlayerGuideImageLeadCanvasObj:Object = {};
   
   private var bookSkillName:String = "";
   
   public function ImageInstanceGuide()
   {
      super();
   }
   
   public function setNewPlayerGuideObj(param1:Boolean, param2:int, param3:int) : void
   {
   }
   
   public function newPlayerGuideImageLeadCanvasTipToNull(param1:*) : void
   {
      this.newPlayerGuideImageLeadCanvasObj[param1] = null;
      delete this.newPlayerGuideImageLeadCanvasObj[param1];
   }
   
   public function removeAllImageInstanceGuide() : void
   {
      var _loc1_:* = undefined;
      for(_loc1_ in this.newPlayerGuideImageLeadCanvasObj)
      {
         GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[_loc1_],_loc1_);
      }
   }
   
   public function addImageInstanceGuide(param1:*, param2:Object = null) : void
   {
      var _loc3_:Array = null;
      var _loc4_:Array = null;
      var _loc5_:Array = null;
      var _loc6_:Array = null;
      var _loc7_:Array = null;
      var _loc8_:TaskRes = null;
      var _loc9_:Goods = null;
      var _loc10_:int = 0;
      var _loc11_:* = 0;
      var _loc12_:CharTaskData = null;
      var _loc13_:int = 0;
      var _loc14_:int = 0;
      var _loc15_:* = undefined;
      switch(param1)
      {
         case MainUI.IMAGE_LEAD_TYPE_POINT:
            if(param2 == "complete")
            {
               return;
            }
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_POINT);
            break;
         case MainUI.IMAGE_LEAD_TYPE_ZHENGQI_FULL:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_BACKPACK_FULL:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_RECOVER_HP_NOEN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_RECOVER_MP_NOEN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_RECOVER_SP_NOEN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEJIU_ZREO:
            if(param2 is String)
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            _loc3_ = param2 as Array;
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,_loc3_);
            break;
         case MainUI.IMAGE_LEAD_TYPE_RIDE_LV:
            break;
         case MainUI.IMAGE_LEAD_TYPE_APPECTED_NEW_TASK:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE,"complete");
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHIXIAN_TASK_APPECTABLE,"complete");
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_ZHIXIAN_TASK_APPECTABLE:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE,"complete");
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_APPECTED_NEW_TASK,"complete");
            _loc4_ = param2 as Array;
            if(_loc4_.length == 0)
            {
               return;
            }
            _loc8_ = _loc4_[0];
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,_loc8_);
            break;
         case MainUI.IMAGE_LEAD_TYPE_TASK_TARGET_COMPLETE:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_APPECTED_NEW_TASK,"complete");
            this.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHIXIAN_TASK_APPECTABLE,"complete");
            _loc5_ = param2 as Array;
            _loc6_ = [];
            _loc11_ = 0;
            while(_loc11_ < _loc5_.length)
            {
               _loc12_ = _loc5_[_loc11_];
               _loc13_ = _loc12_.taskID;
               _loc6_.push(_loc13_);
               _loc11_++;
            }
            _loc7_ = _loc6_.slice();
            _loc11_ = int(_loc6_.length);
            while(_loc11_ >= 0)
            {
               _loc14_ = 0;
               while(_loc14_ < this.outTaskIDArr.length)
               {
                  if(_loc6_[_loc11_] == this.outTaskIDArr[_loc14_])
                  {
                     _loc6_.splice(_loc11_,1);
                  }
                  _loc14_++;
               }
               _loc11_--;
            }
            this.outTaskIDArr = _loc7_;
            _loc8_ = TaskResManager.getTaskRes(_loc6_[0]);
            if(_loc6_.length > 0)
            {
               this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,{
                  "taskID":_loc6_[0],
                  "taskName":_loc8_.name
               });
            }
            break;
         case MainUI.IMAGE_LEAD_TYPE_TASK_PRIZE_EQUIP:
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEW_GOOD_EQUIP:
            _loc9_ = param2.goods;
            if(param2.str != "")
            {
               if(_loc9_ == this.tempGood)
               {
                  GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               }
               return;
            }
            this.tempGood = _loc9_;
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,_loc9_);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEW_KUNGFU:
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV:
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_KUNGFU_LV);
            break;
         case MainUI.IMAGE_LEAD_TYPE_KUNGFU_BOOK:
            if(Boolean(param2 is Skill) && Boolean(param2.res) && Boolean(this.bookGoods))
            {
               this.bookSkillName = "《" + param2.res.name + "》";
               if("《" + param2.res.name + "》" == this.bookGoods.res.name)
               {
                  GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               }
               return;
            }
            this.bookGoods = param2 as Goods;
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,this.bookGoods);
            break;
         case MainUI.IMAGE_LEAD_TYPE_GET_ITEM_FLOOR:
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_BIGUAN_TIME_TO_12_HORSE_FLOOR:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_GIFT_FLOOR:
            _loc10_ = int(param2.giftType);
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,_loc10_);
            break;
         case MainUI.IMAGE_LEAD_TYPE_ANQI_LV_STOP:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_GTE_ANQI:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_BYE_BYE_IS_FRIEND:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_YU_PEI_UPDATA:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEW_EYE_SPEAK:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEW_EAT:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NEW_MONEY:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_NO_JIAN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_FANG_CHEN_MI:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_XIAKEDAO_MAP_OPEN:
            if(param2 == "complete")
            {
               for(_loc15_ in this.newPlayerGuideImageLeadCanvasObj)
               {
                  if(isNaN(Number(_loc15_)))
                  {
                     GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[_loc15_],_loc15_);
                  }
               }
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param2.name] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param2.name],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_GET_LUNJIANTAI_GIFT:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT2:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT3:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT4:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT5:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_LUNJIANTAI_START:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_CHUI_XIAO_UP:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_EN_SHI_LING:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.QINGGONGYAN_BEIGIN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_CISHA:
            if(param2 == "complete")
            {
               return;
            }
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_CISHA);
            break;
         case MainUI.IMAGE_LEAD_TYPE_FUCHOU:
            if(param2 == "complete")
            {
               return;
            }
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_FUCHOU);
            break;
         case MainUI.IMAGE_LEAD_TYPE_DIWANGHUANGQI:
            if(param2 == "complete")
            {
               for(_loc15_ in this.newPlayerGuideImageLeadCanvasObj)
               {
                  if(isNaN(Number(_loc15_)))
                  {
                     GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[_loc15_],_loc15_);
                  }
               }
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param2.name] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param2.name],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_MOXUE_FULL:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_GIRL_XINQING_LOW:
            if(param2 == "complete")
            {
               return;
            }
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_GIRL_XINQING_LOW);
            break;
         case MainUI.IMAGE_LEAD_TYPE_LIANQI_FULL:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_SHENDIAOXIALV:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
            break;
         case MainUI.IMAGE_LEAD_TYPE_BYE_BYE_QUJIAN:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_FUQI_ITEM:
            if(param2 == "complete")
            {
               GameInstance.uiInstance.mainUI.closeTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1);
               return;
            }
            this.newPlayerGuideImageLeadCanvasObj[param1] = GameInstance.uiInstance.mainUI.setImageTip(this.newPlayerGuideImageLeadCanvasObj[param1],param1,param2);
            break;
         case MainUI.IMAGE_LEAD_TYPE_WANGZHEZHIBANG:
            if(param2 == "complete")
            {
               return;
            }
            GameInstance.uiInstance.mainUI.functionContainer.guideBar.addBtn(MainUI.IMAGE_LEAD_TYPE_WANGZHEZHIBANG);
      }
   }
   
   public function save(param1:int) : void
   {
      var _loc2_:NewPlayerGuideVO = this.newPlayerGuideObj[NewPlayerGuideType.TU_BIAO_SHI_GUIDE + "" + param1];
      NewPlayerGuideStaticFun.sendMsg50563({
         "type":NewPlayerGuideType.TU_BIAO_SHI_GUIDE,
         "isComplete":_loc2_.getIsComplete,
         "id":param1,
         "count":_loc2_.getCount
      });
   }
}

class JianTouGuide
{
   
   private var newPlayerGuideObj:Object = {};
   
   private var testID:int;
   
   public function JianTouGuide()
   {
      var _loc2_:int = 0;
      var _loc3_:String = null;
      var _loc4_:NewPlayerGuideVO = null;
      super();
      var _loc1_:int = 0;
      while(_loc1_ < NewPlayerGuideStaticFun.newPlayerGuideXML.step.length())
      {
         _loc2_ = int(NewPlayerGuideStaticFun.newPlayerGuideXML.step[_loc1_].@id);
         _loc3_ = NewPlayerGuideStaticFun.newPlayerGuideXML.step[_loc2_ - 1].content;
         _loc4_ = new NewPlayerGuideVO(false,0,_loc2_,_loc3_);
         this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + _loc2_] = _loc4_;
         _loc1_++;
      }
   }
   
   public function setNewPlayerGuideObj(param1:Boolean, param2:int, param3:int) : void
   {
      var _loc4_:NewPlayerGuideVO = this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + param3];
      _loc4_.setCount = param2;
      _loc4_.setIsComplete = param1;
   }
   
   public function getNewPlayerGuideVO(param1:int) : NewPlayerGuideVO
   {
      return this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + param1];
   }
   
   public function getNewPlayerGuideIsShowingAtStage(param1:int) : Boolean
   {
      var _loc2_:NewPlayerGuideVO = this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + param1] as NewPlayerGuideVO;
      return _loc2_.getIsShowing;
   }
   
   public function closeNewPlayerGuide(param1:int) : void
   {
      this.testID = 0;
      var _loc2_:NewPlayerGuideVO = this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + param1] as NewPlayerGuideVO;
      _loc2_.setIsShowing = false;
      if(_loc2_.runToolTipCloseFun != null)
      {
         _loc2_.runToolTipCloseFun();
      }
   }
   
   public function addAndShowOneNewPlayerGuide(param1:int) : void
   {
      if(!NewPlayerGuideStaticFun.isReceived50652)
      {
         NewPlayerGuideStaticFun.waitAddAndShowOneNewPlayerGuideArr.push(param1);
         return;
      }
      if(this.testID == param1)
      {
         return;
      }
      this.testID = param1;
      var _loc2_:NewPlayerGuideVO = this.newPlayerGuideObj[NewPlayerGuideType.JIAN_TOU_SHI_GUIDE + "" + param1] as NewPlayerGuideVO;
      if(_loc2_.getIsComplete)
      {
         this.closeNewPlayerGuide(param1);
         return;
      }
      _loc2_.setCount = _loc2_.getCount + 1;
      if(_loc2_.getCount >= NewPlayerGuideType["Guide" + param1 + "MaxNum"])
      {
         _loc2_.setIsComplete = true;
      }
      _loc2_.setIsShowing = true;
      var _loc3_:LeadArrowTip = OptionTip.showTip(param1,_loc2_.getContent);
      if(_loc3_)
      {
         _loc2_.setToolTipCloseFun = _loc3_.close;
      }
      NewPlayerGuideStaticFun.sendMsg50563({
         "type":NewPlayerGuideType.JIAN_TOU_SHI_GUIDE,
         "isComplete":_loc2_.getIsComplete,
         "id":param1,
         "count":_loc2_.getCount
      });
   }
}

class LevelGuide
{
   
   public function LevelGuide()
   {
      var _loc2_:int = 0;
      var _loc3_:String = null;
      super();
      var _loc1_:int = 0;
      while(_loc1_ < NewPlayerGuideStaticFun.newPlayerGuideXML.level.length())
      {
         _loc2_ = int(NewPlayerGuideStaticFun.newPlayerGuideXML.level[_loc1_].@id);
         _loc3_ = NewPlayerGuideStaticFun.newPlayerGuideXML.level[_loc1_].content;
         NewPlayerGuideStaticFun.levelGuideArr[_loc2_] = _loc3_;
         _loc1_++;
      }
   }
}
