package com.tgame.shell.view.components.xidushidai
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class PartyChangePanel extends FPanel
   {
      
      public static const UI_QUEDINGZHUANGHUAN_CLICK:String = "UI_QUEDINGZHUANGHUAN_CLICK";
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var ChangeBtn:SecondButton;
      
      private var AllSprite:Sprite;
      
      private var container:Sprite;
      
      private var container2:Sprite;
      
      private var bg:DisplayObject;
      
      private var xuanzhongBit:DisplayObject;
      
      private var index:int;
      
      public function PartyChangePanel()
      {
         var i:int;
         var onItemClick:Function;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         this.width = 670 + 53;
         this.height = 503 - 83;
         this.titleText = LanResManager.getLanCommonTextWords("门派转换");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 5;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请选择要转换的新门派！") + "</font>";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 355;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：玩家当前门派不可以进行同门派转换！") + "</font>";
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            autoSize = TextFieldAutoSize.LEFT;
            x = 670 - 20 - 100;
            y = 355;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("转换说明") + "</font>";
         }
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("确定转换后，将扣除一张门派转换符，转换新的门派") + "<br>" + LanResManager.getLanCommonTextWords("装备可以找襄阳城的雷大锤进行装备门派装换。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.ChangeBtn = new SecondButton();
         this.ChangeBtn.label = LanResManager.getLanCommonTextWords("确定转换");
         addChild(this.ChangeBtn);
         this.ChangeBtn.enabled = false;
         this.ChangeBtn.x = (this.width - this.ChangeBtn.width) / 2;
         this.ChangeBtn.y = 355;
         this.ChangeBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.AllSprite = new Sprite();
         this.AllSprite.x = 10;
         this.AllSprite.y = 20;
         addChild(this.AllSprite);
         while(this.AllSprite.numChildren > 0)
         {
            this.AllSprite.removeChildAt(0);
         }
         i = 0;
         while(i < 3)
         {
            onItemClick = function(param1:MouseEvent):void
            {
               ChangeBtn.enabled = true;
               container2 = AllSprite.getChildByName(param1.currentTarget.name) as Sprite;
               if(!xuanzhongBit)
               {
                  xuanzhongBit = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaizhuanhuan/selected.swf");
               }
               container2.addChild(xuanzhongBit);
               if(GameInstance.mainCharData.attributeInfo.getSex())
               {
                  switch(int(param1.currentTarget.name))
                  {
                     case 0:
                        index = 1;
                        break;
                     case 1:
                        index = 2;
                        break;
                     case 2:
                        index = 6;
                  }
               }
               else
               {
                  switch(int(param1.currentTarget.name))
                  {
                     case 0:
                        index = 3;
                        break;
                     case 1:
                        index = 4;
                        break;
                     case 2:
                        index = 5;
                  }
               }
            };
            this.container = new Sprite();
            this.AllSprite.addChild(this.container);
            with(this.container.graphics)
            {
               
               beginFill(0,0);
               drawRect(0,0,226,320);
               endFill();
            }
            this.container.name = String(i);
            this.container.addEventListener(MouseEvent.CLICK,onItemClick);
            this.container.x = (this.container.width + 8) * i;
            this.container.y = 0;
            if(GameInstance.mainCharData.attributeInfo.getSex())
            {
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaizhuanhuan/nan/" + i + ".swf");
               this.container.addChild(this.bg);
            }
            else
            {
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/menpaizhuanhuan/nv/" + i + ".swf");
               this.container.addChild(this.bg);
            }
            i++;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_QUEDINGZHUANGHUAN_CLICK,"",this.index));
      }
   }
}

