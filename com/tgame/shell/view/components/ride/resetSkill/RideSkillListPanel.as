package com.tgame.shell.view.components.ride.resetSkill
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Skill;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class RideSkillListPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      public function RideSkillListPanel()
      {
         var bg:FCanvas = null;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 423;
         height = 433;
         titleText = LanResManager.getLanCommonTextWords("坐骑技能大全");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new FCanvas();
         bg.skin = "box";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         bg.width = 402;
         bg.height = 385;
         this.container = new Sprite();
         addChild(this.container);
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,400,380);
            endFill();
         }
         this.container.x = 13;
         this.container.y = 4;
         this.scroll = new FVScorllBar(this.container,380);
         this.scroll.x = 413 - this.scroll.width;
         this.scroll.y = 4;
         addChild(this.scroll);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:skillRenderVO = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new skillRenderVO();
            _loc4_.$parent = this.$parent;
            _loc4_.Data = param1[_loc2_] as Skill;
            this.container.addChild(_loc4_);
            _loc4_.x = 3;
            _loc4_.y = 63 * _loc2_;
            _loc2_++;
         }
         this.scroll.update();
      }
   }
}

import com.fireice.text.FTextArea;
import com.tgame.common.res.lan.*;
import com.tgame.common.ui.componets.*;
import com.tgame.common.vo.item.Skill;
import com.tgame.shell.view.components.RideSkillResetPanel;
import com.zcp.common.events.BaseEvent;
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.*;
import flash.text.*;

class skillRenderVO extends Sprite
{
   
   public var $parent:DisplayObject;
   
   private var skill:Skill;
   
   public function skillRenderVO()
   {
      super();
   }
   
   public function set Data(param1:Skill) : void
   {
      var bg:Bitmap;
      var item:ItemFace;
      var str:String;
      var ft:FTextArea;
      var btn:SmallButton;
      var line:Bitmap;
      var value:Skill = param1;
      this.skill = value;
      while(numChildren > 0)
      {
         removeChildAt(0);
      }
      bg = StaticValue.getBitmapByClassName("ui.tiem.slot");
      addChild(bg);
      bg.x = 13;
      bg.y = 11;
      item = new ItemFace(value);
      item.setShowCount(false);
      addChild(item);
      item.x = 15;
      item.y = 13;
      str = "";
      switch(value.res.mount_use_tuijian)
      {
         case 1:
            str = "<font color=\'" + StaticValue.GREEN_HTML + "\'>【" + LanResManager.getLanCommonTextWords("推荐骑乘坐骑学习") + "】</font>";
            break;
         case 2:
            str = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>【" + LanResManager.getLanCommonTextWords("推荐出战坐骑学习") + "】</font>";
      }
      ft = new FTextArea();
      with(ft)
      {
         x = 64;
         y = 8;
         width = 260;
         autoSize = TextFieldAutoSize.LEFT;
         wordWrap = true;
         textColor = StaticValue.WHITE;
         filters = StaticValue.filter;
         htmlText = "<textformat leading=\'0.1\'><font color=\'" + StaticValue.BLUE_HTML + "\'>【" + value.res.name + "】</font>【" + (value.res.useway == 1 ? LanResManager.getLanCommonTextWords("主动技能") : LanResManager.getLanCommonTextWords("被动技能")) + "】" + str + "<br>" + value.res.desc + "</textformat>";
      }
      addChild(ft);
      btn = new SmallButton();
      with(btn)
      {
         label = LanResManager.getLanCommonTextWords("选择");
         x = 340;
         y = 20;
         addEventListener(MouseEvent.CLICK,onClick);
      }
      addChild(btn);
      line = StaticValue.getBitmapByClassName("ui.line");
      line.width = 380;
      addChild(line);
      line.y = 72;
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      this.$parent.dispatchEvent(new BaseEvent(RideSkillResetPanel.UI_RIDE_SKILL_RESET_SKILL_SELECT,"",this.skill));
   }
}
