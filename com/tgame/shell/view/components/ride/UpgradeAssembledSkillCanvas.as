package com.tgame.shell.view.components.ride
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class UpgradeAssembledSkillCanvas extends Sprite
   {
      
      public var bgImg:Bitmap;
      
      private var _mask:Shape;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var equipContainer:Sprite;
      
      private var slots:Sprite;
      
      private var slotsBg:Sprite;
      
      private var img:Bitmap;
      
      private var SkillAr:Array = new Array();
      
      private var SkillCount:int;
      
      public function UpgradeAssembledSkillCanvas()
      {
         super();
         this.bgImg = new Bitmap();
         addChild(this.bgImg);
         this.bgImg.name = "ui.ride.skill.assembled.ui";
         this.init();
      }
      
      private function init() : void
      {
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 310;
            height = 210;
            x = 10;
            y = 30;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            wordWrap = true;
         }
         this.fta.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"坐骑组合技说明",[StaticValue.BlUE20_HTML],false) + "</textformat>";
         addChild(this.fta);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            width = 310;
            height = 40;
            x = 10;
            y = 225;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            wordWrap = true;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("【赤焰魔狮】拥有一项组合技能使用能力") + "<br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("下阶坐骑【傲视炎豹】拥有两项组合技同时生效能力") + "</font>" + "</textformat>";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 260;
            height = 20;
            x = 10;
            y = 270;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            htmlText = LanResManager.getLanCommonTextWords("请将您希望该坐骑自动使用的武学拖入本栏");
         }
         addChild(this.fta);
         this.img = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot");
         addChild(this.img);
         this.img.x = 12;
         this.img.y = 292;
         this.slotsBg = new Sprite();
         with(this.slotsBg)
         {
            x = 12;
            y = 292;
         }
         addChild(this.slotsBg);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 12;
         this.equipContainer.y = 292;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,180,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onEquip,false,30);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 125;
            height = 45;
            x = 202;
            y = 295;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            wordWrap = true;
         }
         this.fta.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"坐骑组合技触发说明") + "</textformat>";
         addChild(this.fta);
      }
      
      private function onEquip(param1:MouseEvent) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         var _loc5_:BaseItem = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc2_:int = param1.currentTarget.mouseX / 47;
         if(_loc2_ < this.SkillCount)
         {
            _loc6_ = false;
            _loc7_ = 0;
            while(_loc7_ < this.SkillAr.length)
            {
               _loc3_ = this.SkillAr[_loc7_] as Skill;
               if(_loc3_.position == _loc2_ + 1)
               {
                  _loc4_ = new ItemFace(_loc3_);
                  _loc6_ = true;
                  break;
               }
               _loc6_ = false;
               _loc7_++;
            }
            if(_loc6_)
            {
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,"",[_loc4_,_loc2_ + 1]));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(RideFeedPanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,"",[null,_loc2_ + 1]));
            }
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function SetInitialize(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         if(param5 == 0)
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"只有[赤焰魔狮]以上") + "</textformat>";
         }
         else if(param5 == 4)
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"龙鳞圣兽拥有四项组合技同时生效的使用能力",[param1,param2]) + "</textformat>";
         }
         else
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"当前坐骑拥有组合技能",[param1,param2]) + "<br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,"下阶坐骑拥有组合技能",[param3,param4]) + "</font>" + "</textformat>";
         }
         this.SkillCount = param5;
         while(this.slotsBg.numChildren > 0)
         {
            this.slotsBg.removeChildAt(0);
         }
         var _loc6_:int = int(param5);
         while(_loc6_ < 4)
         {
            this.img = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
            this.slotsBg.addChild(this.img);
            this.img.x = _loc6_ * 47;
            this.img.y = 0;
            _loc6_++;
         }
      }
      
      public function SetSkillInitialize(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:BaseItem = null;
         var _loc4_:Skill = null;
         this.SkillAr = param1;
         while(this.equipContainer.numChildren > 0)
         {
            _loc2_ = this.equipContainer.getChildAt(0) as ItemFace;
            this.equipContainer.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = param1[_loc5_];
            _loc4_ = param1[_loc5_] as Skill;
            _loc2_ = new ItemFace(_loc4_);
            _loc2_.x = (_loc4_.position - 1) * 47 + 2;
            _loc2_.y = 0 + 2;
            if(_loc4_.position <= 4)
            {
               this.equipContainer.addChild(_loc2_);
            }
            _loc5_++;
         }
      }
   }
}

