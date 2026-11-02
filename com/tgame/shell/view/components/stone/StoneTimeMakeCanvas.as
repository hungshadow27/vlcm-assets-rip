package com.tgame.shell.view.components.stone
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.StonePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class StoneTimeMakeCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var put1Btn:SmallButton;
      
      private var put2Btn:SmallButton;
      
      private var makeBtn:SmallButton;
      
      private var changeBtn:SmallButton;
      
      private var btn:FSimpleButton;
      
      private var menuContainer:FCanvas;
      
      private var skillContainer:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var makeStone:ItemFace;
      
      private var changeStone:ItemFace;
      
      private var stone:ItemFace;
      
      private var material:ItemFace;
      
      private var changeTips:FTextArea;
      
      public function StoneTimeMakeCanvas()
      {
         var ft:FTextArea;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.stone.time.make.ui";
         addChild(this.bg);
         ft = new FTextArea();
         with(ft)
         {
            x = 79;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"宝石限时加工说明",[StaticValue.WHITE_HTML,StaticValue.PURPLE_HTML]);
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 79;
            y = 93;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"宝石限时加工成功几率",[StaticValue.RED_HTML]);
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 79;
            y = 126;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"转换步骤说明3",[StaticValue.WHITE_HTML]);
         }
         addChild(ft);
         this.changeTips = new FTextArea();
         with(this.changeTips)
         {
            x = 79;
            y = 249;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"转换成功几率",[StaticValue.GREEN,StaticValue.RED_HTML]);
         }
         addChild(this.changeTips);
         this.put1Btn = new SmallButton();
         this.put1Btn.x = 8;
         this.put1Btn.y = 26;
         this.put1Btn.label = LanResManager.getLanCommonTextWords("放入宝石");
         this.put1Btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.put1Btn);
         this.put2Btn = new SmallButton();
         this.put2Btn.x = 8;
         this.put2Btn.y = 126;
         this.put2Btn.label = LanResManager.getLanCommonTextWords("放入宝石");
         this.put2Btn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.put2Btn);
         this.makeBtn = new SmallButton();
         this.makeBtn.x = 235;
         this.makeBtn.y = 97;
         this.makeBtn.label = LanResManager.getLanCommonTextWords("开始加工");
         this.makeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.makeBtn);
         this.changeBtn = new SmallButton();
         this.changeBtn.x = 235;
         this.changeBtn.y = 263;
         this.changeBtn.label = LanResManager.getLanCommonTextWords("开始转换");
         this.changeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.changeBtn);
         this.btn = new FSimpleButton();
         this.btn.skin = "bottomButton";
         addChild(this.btn);
         this.btn.x = 54;
         this.btn.y = 276;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 39;
         this.menuContainer.height = 79;
         this.menuContainer.x = 15;
         this.menuContainer.y = 294;
         this.menuContainer.visible = false;
         this.skillContainer = new Sprite();
         with(this.skillContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,35,75);
            endFill();
         }
         this.skillContainer.x = this.skillContainer.y = 2;
         this.menuContainer.addChild(this.skillContainer);
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.scroll = new FVScorllBar(this.skillContainer,75);
         this.menuContainer.addChild(this.scroll);
         this.scroll.x = 40;
         this.scroll.y = 2;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.menuContainer.visible = false;
         if(param1.target is ItemFace)
         {
            this.setStone((param1.target as ItemFace).getBaseItem());
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.menuContainer.visible = !this.menuContainer.visible;
               break;
            case this.put1Btn:
               if(this.put1Btn.label == LanResManager.getLanCommonTextWords("取出宝石"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_GET));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_STONE_PUT));
               }
               break;
            case this.makeBtn:
               this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_MAKE_START));
               break;
            case this.put2Btn:
               if(this.put2Btn.label == LanResManager.getLanCommonTextWords("取出宝石"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_GET));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_PUT));
               }
               break;
            case this.changeBtn:
               if(this.stone)
               {
                  this.$parent.dispatchEvent(new BaseEvent(StonePanel.UI_STONE_PANEL_TIME_MAKE_CHANGE_STONE_START,"",this.stone.getBaseItem().id));
               }
         }
      }
      
      private function setStone(param1:BaseItem) : void
      {
         if(Boolean(this.stone) && Boolean(this.stone.parent))
         {
            this.stone.parent.removeChild(this.stone);
         }
         this.stone = new ItemFace(param1);
         addChild(this.stone);
         this.stone.x = 17;
         this.stone.y = 258;
      }
      
      public function setMakeStone(param1:Goods) : void
      {
         if(Boolean(this.makeStone) && Boolean(this.makeStone.parent))
         {
            this.makeStone.parent.removeChild(this.makeStone);
         }
         if(!param1)
         {
            this.put1Btn.label = LanResManager.getLanCommonTextWords("放入宝石");
            return;
         }
         this.makeStone = new ItemFace(param1);
         addChild(this.makeStone);
         this.makeStone.x = 17;
         this.makeStone.y = 50;
         this.put1Btn.label = LanResManager.getLanCommonTextWords("取出宝石");
      }
      
      public function setChangeStone(param1:Goods) : void
      {
         if(Boolean(this.changeStone) && Boolean(this.changeStone.parent))
         {
            this.changeStone.parent.removeChild(this.changeStone);
         }
         if(!param1)
         {
            this.put2Btn.label = LanResManager.getLanCommonTextWords("放入宝石");
            return;
         }
         this.changeStone = new ItemFace(param1);
         this.changeStone.setShowCount(false);
         addChild(this.changeStone);
         this.changeStone.x = 17;
         this.changeStone.y = 150;
         this.put2Btn.label = LanResManager.getLanCommonTextWords("取出宝石");
      }
      
      public function setChangeMaterial(param1:Goods, param2:Boolean) : void
      {
         if(Boolean(this.material) && Boolean(this.material.parent))
         {
            this.material.parent.removeChild(this.material);
         }
         if(!param1)
         {
            return;
         }
         this.material = new ItemFace(param1);
         addChild(this.material);
         this.material.x = 17;
         this.material.y = 204;
         if(param2)
         {
            this.changeTips.htmlText = LanResManager.getLanTextWords(this,"设置转换材料成功几率1",[StaticValue.GREEN,param1.count,StaticValue.RED_HTML]);
         }
         else
         {
            this.material.filters = Tools.blackWhiteFilter;
            this.changeTips.htmlText = LanResManager.getLanTextWords(this,"六品宝石转换无需幸运晶2",[StaticValue.GREEN,param1.count,StaticValue.RED_HTML]);
         }
      }
      
      public function setChangeStones(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         if(!param1 || param1.length == 0)
         {
            return;
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Goods);
            this.skillContainer.addChild(_loc4_);
            _loc4_.y = _loc2_ * 35;
            _loc2_++;
         }
         this.scroll.update();
         this.setStone(param1[0] as BaseItem);
      }
   }
}

