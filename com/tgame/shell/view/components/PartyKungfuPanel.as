package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class PartyKungfuPanel extends FPanel
   {
      
      public static const UI_PARTY_KUNGFU_STUDY:String = "UI_PARTY_KUNGFU_STUDY";
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      public function PartyKungfuPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 678;
         height = 348;
         titleText = LanResManager.getLanCommonTextWords("帮会武学");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.kungfu.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 13;
         this.container.y = 24;
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,635,278);
            endFill();
         }
         this.scroll = new FVScorllBar(this.container,278);
         addChild(this.scroll);
         this.scroll.x = 648;
         this.scroll.y = 24;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDate(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:PartyKungfuRenderVO = null;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new PartyKungfuRenderVO();
            _loc4_.setData(param1[_loc2_][0],param1[_loc2_][1]);
            this.container.addChild(_loc4_);
            _loc4_.$parent = this;
            _loc4_.y = _loc2_ * 60;
            _loc2_++;
         }
         this.scroll.update();
      }
      
      public function updata(param1:Skill, param2:Goods) : void
      {
         var _loc3_:int = 0;
         var _loc5_:PartyKungfuRenderVO = null;
         var _loc4_:int = this.container.numChildren;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = this.container.getChildAt(_loc3_) as PartyKungfuRenderVO;
            if(_loc5_.skill.id == param1.id)
            {
               _loc5_.setData(param1,param2);
            }
            _loc3_++;
         }
      }
   }
}

import com.fireice.text.FLabel;
import com.fireice.text.FTextArea;
import com.fireice.util.Tools;
import com.tgame.common.*;
import com.tgame.common.res.lan.*;
import com.tgame.common.ui.componets.*;
import com.tgame.common.vo.item.Goods;
import com.tgame.common.vo.item.Skill;
import com.zcp.common.events.BaseEvent;
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.*;

class PartyKungfuRenderVO extends Sprite
{
   
   public var $parent:DisplayObject;
   
   public var skill:Skill;
   
   public function PartyKungfuRenderVO()
   {
      super();
   }
   
   public function setData(param1:Skill, param2:Goods) : void
   {
      var line:Bitmap;
      var bg:Bitmap;
      var skillItem:ItemFace;
      var ft:FTextArea;
      var lb:FLabel = null;
      var item:ItemFace = null;
      var btn:SmallButton = null;
      var v1:Skill = param1;
      var v2:Goods = param2;
      this.skill = v1;
      while(numChildren > 0)
      {
         removeChildAt(0);
      }
      line = StaticValue.getBitmapByClassName("ui.line");
      line.width = 635;
      addChild(line);
      line.y = 58;
      bg = StaticValue.getBitmapByClassName("ui.tiem.slot");
      addChild(bg);
      bg.x = 15;
      bg.y = 6;
      skillItem = new ItemFace(v1);
      addChild(skillItem);
      skillItem.x = 17;
      skillItem.y = 8;
      if(v1.isLearn == 0)
      {
         skillItem.filters = Tools.blackWhiteFilter;
      }
      ft = new FTextArea();
      with(ft)
      {
         x = 66;
         y = 5;
         width = 310;
         height = 50;
         wordWrap = true;
         textColor = StaticValue.WHITE;
         filters = StaticValue.filter;
         htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>【" + v1.res.name + "】</font><br>" + LanResManager.getLanCommonTextWords("效果说明") + "：" + v1.res.desc + "</textformat>";
      }
      addChild(ft);
      if(v1.isLearn == 1)
      {
         bg = StaticValue.getBitmapByClassName("ui.party.kungfu.text.ok");
         addChild(bg);
         bg.x = 262;
         bg.y = 2;
         lb = new FLabel();
         with(lb)
         {
            
            x = 400;
            y = 20;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("可在主操作栏的武功面板中提升或使用");
         }
         addChild(lb);
      }
      else
      {
         ft = new FTextArea();
         with(ft)
         {
            
            x = 370;
            y = 5;
            width = 310;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("需要等级") + "：<font color=\'" + (GameInstance.mainCharData.attributeInfo.lv >= v1.studyLevel ? StaticValue.GREEN_HTML : StaticValue.RED_HTML) + "\'>" + v1.studyLevel + "</font><br>" + LanResManager.getLanCommonTextWords("需要秘籍") + "：<font color=\'" + (v2.count == 0 ? StaticValue.RED_HTML : StaticValue.GREEN) + "\'>" + v2.res.name + "</font><br>" + LanResManager.getLanCommonTextWords("需要帮贡") + "：<font color=\'" + (v1.res.bangGong > GameInstance.mainCharData.banghuiInfo.banggong ? StaticValue.RED_HTML : StaticValue.GREEN) + "\'>" + v1.res.bangGong + "</font></textformat>";
         }
         addChild(ft);
         bg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(bg);
         bg.x = 550;
         bg.y = 6;
         item = new ItemFace(v2);
         addChild(item);
         item.x = 552;
         item.y = 8;
         if(v2.count == 0)
         {
            item.filters = Tools.blackWhiteFilter;
         }
         btn = new SmallButton();
         btn.label = LanResManager.getLanCommonTextWords("学习");
         addChild(btn);
         btn.x = 597;
         btn.y = 26;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
   
   private function onClick(param1:MouseEvent) : void
   {
      this.$parent.dispatchEvent(new BaseEvent(PartyKungfuPanel.UI_PARTY_KUNGFU_STUDY,"",this.skill.id));
   }
}
