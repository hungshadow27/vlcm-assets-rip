package com.tgame.shell.view.components.amulet
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.AmuletPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AmuletMakeCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var ft1:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var putBtn:SmallButton;
      
      private var it1:ItemFace;
      
      private var it2:ItemFace;
      
      private var it3:ItemFace;
      
      private var helpBtn:FSimpleButton;
      
      public function AmuletMakeCanvas()
      {
         var ft:FTextArea;
         var img:Bitmap = null;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.amulet.sarira.refine.ui";
         addChild(this.bg);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入护符");
         addChild(this.putBtn);
         this.putBtn.x = 3;
         this.putBtn.y = 10;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 6;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"护身符进阶合成",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTM,StaticValue.WHITE_HTM,StaticValue.WHITE_HTM],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 76;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"进阶合成步骤说明",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTM,StaticValue.WHITE_HTM,StaticValue.WHITE_HTM],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 146;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"若进阶失败只回收聚灵珠和铜币",[StaticValue.WHITE_HTML,StaticValue.BLUE_HTML,StaticValue.BLUE_HTML],false) + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.amulet.text.julingzhu");
         addChild(img);
         img.x = 15;
         img.y = 225;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 71;
            y = 230;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"本次操作消耗铜币");
         }
         addChild(this.ft1);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanTextWords(this,"开始进阶");
         addChild(this.startBtn);
         this.startBtn.x = (307 - this.startBtn.width) / 2;
         this.startBtn.y = 310;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 20;
         this.helpBtn.y = 309;
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn.visible = false;
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_HUSHENFU_HECHENG))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_HUSHENFU_HECHENG);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_HUSHENFU_HECHENG);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanTextWords(this,"取出护符"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_AMULET_PANEL_MAKE_GET_STONE));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_AMULET_PANEL_MAKE_PUT_STONE));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_AMULET_PANEL_MAKE_START));
         }
      }
      
      public function setHushenfu(param1:Goods = null, param2:Goods = null) : void
      {
         if(Boolean(this.it1) && Boolean(this.it1.parent))
         {
            this.it1.parent.removeChild(this.it1);
         }
         if(param1)
         {
            this.it1 = new ItemFace(param1);
            addChild(this.it1);
            this.it1.x = 16;
            this.it1.y = 43;
            this.putBtn.label = LanResManager.getLanTextWords(this,"取出护符");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanTextWords(this,"放入护符");
         }
         if(Boolean(this.it2) && Boolean(this.it2.parent))
         {
            this.it2.parent.removeChild(this.it2);
         }
         if(param2)
         {
            this.it2 = new ItemFace(param2);
            addChild(this.it2);
            this.it2.x = 16;
            this.it2.y = 165;
         }
      }
      
      public function setData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc6_:String = "";
         var _loc7_:String = "";
         if(param2)
         {
            _loc6_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font>";
         }
         else
         {
            _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font>";
         }
         if(param4)
         {
            _loc7_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + "</font>";
         }
         else
         {
            _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + "</font>";
         }
         this.ft1.htmlText = LanResManager.getLanTextWords(this,"本次操作消耗聚灵珠",[_loc6_,_loc7_,param5]);
      }
      
      public function setLingzhu(param1:int = 0, param2:Goods = null) : void
      {
         if(Boolean(this.it3) && Boolean(this.it3.parent))
         {
            this.it3.parent.removeChild(this.it3);
         }
         if(param2)
         {
            this.it3 = new ItemFace(param2);
            addChild(this.it3);
            this.it3.x = 16;
            this.it3.y = 248;
            if(param1 != 0)
            {
               this.it3.filters = [];
            }
            else
            {
               this.it3.filters = Tools.blackWhiteFilter;
            }
         }
      }
      
      public function reset() : void
      {
         this.setHushenfu();
         this.setData(0,false,0,false,0);
         this.setLingzhu();
      }
   }
}

