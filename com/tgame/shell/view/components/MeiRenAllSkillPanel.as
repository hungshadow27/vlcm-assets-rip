package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class MeiRenAllSkillPanel extends FPanel
   {
      
      private var jinengSpr:Sprite;
      
      public var $parent:DisplayObject;
      
      private var arrr:Array;
      
      private var scroll:FVScorllBar;
      
      private var skillID1:int = 0;
      
      private var mrID:int = 0;
      
      public function MeiRenAllSkillPanel()
      {
         super();
         skin = "panel";
         width = 374 - 155 + 60;
         height = 308 - 166 + 60;
         titleText = LanResManager.getLanCommonTextWords("美人技能大全");
         dragAble = false;
         this.showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 15;
         this.jinengSpr.y = 5;
         with(this.jinengSpr.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,250,135);
            endFill();
         }
         addChild(this.jinengSpr);
         this.scroll = new FVScorllBar(this.jinengSpr,145);
         addChild(this.scroll);
         this.scroll.x = 252;
         this.scroll.y = 2;
      }
      
      private function onclick(param1:MouseEvent) : void
      {
         var item:ItemFace = null;
         var str:String = null;
         var e:MouseEvent = param1;
         item = e.target as ItemFace;
         if(item.name == "0")
         {
            FAlert.show(LanResManager.getLanCommonTextWords("该技能已学，请选其他技能！"));
         }
         else
         {
            str = LanResManager.getLanCommonTextWords("是否替换本技能？替换技能需要消耗一颗美人技能洗练丹。");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(MeiRenPanel.UI_MEIRENSKILLPANEL_CLICK,"",[mrID,skillID1,int(item.name)]));
                  onClose();
               }
            });
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setJiNeng(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc6_:Bitmap = null;
         var _loc7_:Skill = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc6_.x = 50 * _loc3_ + 2;
            _loc6_.y = 50 * _loc4_ + 5;
            this.jinengSpr.addChild(_loc6_);
            _loc7_ = param1[_loc5_];
            _loc2_ = new ItemFace(_loc7_);
            if(_loc7_.isLearn == 1)
            {
               _loc2_.filters = Tools.blackWhiteFilter;
               _loc2_.name = "0";
            }
            else
            {
               _loc2_.name = String(_loc7_.id);
            }
            _loc2_.setShowCount(false);
            _loc2_.addEventListener(MouseEvent.CLICK,this.onclick);
            _loc2_.x = 50 * _loc3_ + 2 + 2;
            _loc2_.y = 50 * _loc4_ + 5 + 2;
            this.jinengSpr.addChild(_loc2_);
            if(++_loc3_ == 5)
            {
               _loc3_ = 0;
               _loc4_++;
            }
            _loc5_++;
         }
         this.scroll.update();
      }
      
      public function setOldSkill(param1:int, param2:int) : void
      {
         this.skillID1 = param1;
         this.mrID = param2;
      }
   }
}

