package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class BeiDouQiXingZhenJiNengPanel extends FPanel
   {
      
      private var jinengSpr:Sprite;
      
      public var $parent:DisplayObject;
      
      public var $parent1:DisplayObject;
      
      private var arrr:Array;
      
      private var lookingId:int;
      
      public function BeiDouQiXingZhenJiNengPanel()
      {
         var _loc1_:Bitmap = null;
         var _loc3_:Bitmap = null;
         super();
         skin = "panel";
         width = 374 - 155;
         height = 308 - 166;
         titleText = LanResManager.getLanCommonTextWords("北斗七星");
         dragAble = false;
         this.showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         var _loc2_:int = 0;
         while(_loc2_ < 4)
         {
            _loc1_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc1_.x = 15 + 50 * _loc2_;
            _loc1_.y = 5;
            addChild(_loc1_);
            _loc2_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < 4)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc3_.x = 15 + 50 * _loc4_;
            _loc3_.y = 55 - 2;
            addChild(_loc3_);
            _loc4_++;
         }
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 15;
         this.jinengSpr.y = 5;
         addChild(this.jinengSpr);
      }
      
      private function onclick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = param1.target as ItemFace;
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BEIDOUQIXINGZHEN_JINENG_CLICKB,"",[this.lookingId,int(_loc2_.name)]));
         this.onClose();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setJiNeng(param1:*, param2:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc5_:Skill = null;
         this.lookingId = param1;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            _loc5_ = GameInstance.mainCharData.skillInfo.getSkillByID(param2[_loc4_].skill);
            _loc3_ = new ItemFace(_loc5_);
            if(param2[_loc4_].status == 0)
            {
               _loc3_.filters = Tools.darkFilter;
               _loc3_.setShowCount(false);
            }
            else
            {
               _loc3_.setShowCount(true);
            }
            if(_loc5_.id == 80200135)
            {
               _loc3_.setShowCount(false);
            }
            _loc3_.name = String(_loc5_.id);
            _loc3_.addEventListener(MouseEvent.CLICK,this.onclick);
            if(_loc4_ > 3)
            {
               _loc3_.x = 50 * (_loc4_ - 4) + 1 + 1;
               _loc3_.y = 53 - 2 - 1;
            }
            else
            {
               _loc3_.x = 1 + 50 * _loc4_ + 1;
               _loc3_.y = 1 + 5 - 2 - 1 - 1;
            }
            this.jinengSpr.addChild(_loc3_);
            _loc4_++;
         }
      }
   }
}

