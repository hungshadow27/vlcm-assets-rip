package com.tgame.shell.view.components.party
{
   import com.fireice.list.FList;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.Party_taskPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class BangPaiRongYuPanel extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var shizhiBtn:SecondButton;
      
      private var longmaiBtn:SecondButton;
      
      private var jinruBtn:SecondButton;
      
      private var biaoshi:int = 0;
      
      private var miaoshu:FTextArea;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var Scroll:FVScorllBar;
      
      private var cheng1:FTextArea;
      
      private var cheng2:FTextArea;
      
      private var cheng3:FTextArea;
      
      private var cheng4:FTextArea;
      
      private var jiantou1:DisplayObject;
      
      private var jiantou2:DisplayObject;
      
      private var jiantou3:DisplayObject;
      
      public function BangPaiRongYuPanel()
      {
         var ft1:FTextArea;
         var ft2:FTextArea;
         var ft3:FTextArea;
         var ft4:FTextArea;
         var ft5:FTextArea;
         var ft6:FTextArea = null;
         super();
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/bhry.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.jiantou1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/jiantou.swf");
         this.jiantou1.x = 340 + 3;
         this.jiantou1.y = 40;
         addChild(this.jiantou1);
         this.jiantou2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/jiantou.swf");
         this.jiantou2.x = 340 + 103 + 3;
         this.jiantou2.y = 40;
         addChild(this.jiantou2);
         this.jiantou3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/huangtubaye/jiantou.swf");
         this.jiantou3.x = 340 + 206 + 3;
         this.jiantou3.y = 40;
         addChild(this.jiantou3);
         this.miaoshu = new FTextArea();
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.miaoshu);
         this.miaoshu.width = 230;
         this.miaoshu.x = 8;
         this.miaoshu.y = 140 + 32;
         this.zuoshuxing = new FTextArea();
         this.zuoshuxing.multiline = true;
         this.zuoshuxing.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.zuoshuxing);
         this.zuoshuxing.x = 8;
         this.zuoshuxing.y = 195 + 32;
         this.youshuxing = new FTextArea();
         this.youshuxing.multiline = true;
         this.youshuxing.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.youshuxing);
         this.youshuxing.x = 8 + 140;
         this.youshuxing.y = 195 + 32;
         ft1 = new FTextArea();
         ft1.multiline = true;
         ft1.width = 50;
         addChild(ft1);
         ft1.x = 270 - 12 - 10;
         ft1.y = 15;
         ft1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("占") + "<br>" + LanResManager.getLanCommonTextWords("领") + "<br>" + LanResManager.getLanCommonTextWords("情") + "<br>" + LanResManager.getLanCommonTextWords("况") + "</font>";
         ft2 = new FTextArea();
         ft2.multiline = true;
         ft2.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft2);
         ft2.x = 310 - 27;
         ft2.y = 8;
         ft2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("三级城池") + "</font>";
         ft3 = new FTextArea();
         ft3.multiline = true;
         ft3.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft3);
         ft3.x = 310 + 80 - 5;
         ft3.y = 8;
         ft3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("二级城池") + "</font>";
         ft4 = new FTextArea();
         ft4.multiline = true;
         ft4.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft4);
         ft4.x = 310 + 160 + 13;
         ft4.y = 8;
         ft4.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("一级城池") + "</font>";
         ft5 = new FTextArea();
         ft5.multiline = true;
         ft5.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft5);
         ft5.x = 310 + 240 + 40;
         ft5.y = 8;
         ft5.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("皇   城") + "</font>";
         this.cheng1 = new FTextArea();
         this.cheng1.multiline = true;
         this.cheng1.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.cheng1);
         this.cheng1.x = 317;
         this.cheng1.y = 70;
         this.cheng2 = new FTextArea();
         this.cheng2.multiline = true;
         this.cheng2.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.cheng2);
         this.cheng2.x = 317 + 103;
         this.cheng2.y = 70;
         this.cheng3 = new FTextArea();
         this.cheng3.multiline = true;
         this.cheng3.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.cheng3);
         this.cheng3.x = 317 + 206;
         this.cheng3.y = 70;
         this.cheng4 = new FTextArea();
         this.cheng4.multiline = true;
         this.cheng4.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.cheng4);
         this.cheng4.x = 317 + 309;
         this.cheng4.y = 70;
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 425;
         ft6.y = 100 - 6;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池列表") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 425 - 168 + 24;
         ft6.y = 100 - 6 + 23;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池名称") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 425 - 105 - 2 - 2 + 64;
         ft6.y = 100 - 6 + 23;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("城池等级") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 425 - 14 + 30;
         ft6.y = 100 - 6 + 23;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("所属帮会") + "</font>";
         ft6 = new FTextArea();
         ft6.multiline = true;
         ft6.autoSize = TextFieldAutoSize.LEFT;
         addChild(ft6);
         ft6.x = 425 + 110 - 40 + 52;
         ft6.y = 100 - 6 + 23;
         ft6.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("摧毁龙脉英雄") + "</font>";
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 310 - 58;
            y = 110 + 30 - 2;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,320,142);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new ChengChiList();
         this.giftList.listWidth = 385;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.Scroll = new FVScorllBar(this.listContainer,142);
         addChild(this.Scroll);
         this.Scroll.x = 630 + 12;
         this.Scroll.y = 110 + 30;
         this.shizhiBtn = new SecondButton();
         addChild(this.shizhiBtn);
         this.shizhiBtn.x = 100;
         this.shizhiBtn.y = 290;
         this.shizhiBtn.label = LanResManager.getLanCommonTextWords("查看该城史志");
         this.shizhiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.longmaiBtn = new SecondButton();
         addChild(this.longmaiBtn);
         this.longmaiBtn.x = 350;
         this.longmaiBtn.y = 290;
         this.longmaiBtn.label = LanResManager.getLanCommonTextWords("激活龙脉");
         this.longmaiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jinruBtn = new SecondButton();
         addChild(this.jinruBtn);
         this.jinruBtn.x = 500;
         this.jinruBtn.y = 290;
         this.jinruBtn.label = LanResManager.getLanCommonTextWords("传送进入");
         this.jinruBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_RONGYU_CHENGCHI_CLICK,"",this.giftList.selectItem.biaoshi));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shizhiBtn:
               this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_RONGYU_SHIZHI_CLICK,"",[this.giftList.selectItem.biaoshi,1]));
               break;
            case this.longmaiBtn:
               this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_RONGYU_LONGMAI_CLICK,"",this.giftList.selectItem.biaoshi));
               break;
            case this.jinruBtn:
               this._parent.dispatchEvent(new BaseEvent(Party_taskPanel.UI_PARTYTASK_RONGYU_JINRU_CLICK,"",this.giftList.selectItem.biaoshi));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function setInitialize(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.giftList.dataProvider = param1;
         this.giftList.setSelectItemByIndex(0);
         this.Scroll.update();
         this.cheng1.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param4 + "</font>";
         this.cheng2.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param3 + "</font>";
         this.cheng3.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param2 + "</font>";
         this.cheng4.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param5 + "</font>";
         if(param4 > 0)
         {
            this.jiantou1.filters = [];
         }
         else
         {
            this.jiantou1.filters = Tools.blackWhiteFilter;
         }
         if(param3 > 0)
         {
            this.jiantou2.filters = [];
         }
         else
         {
            this.jiantou2.filters = Tools.blackWhiteFilter;
         }
         if(param2 > 0 && param3 > 0 && param4 > 0)
         {
            this.jiantou3.filters = [];
         }
         else
         {
            this.jiantou3.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setChengchi(param1:Object) : void
      {
         if(param1.dengji == 0)
         {
            this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.name + "<br>" + LanResManager.getLanCommonTextWords("当前等级：") + param1.dengji + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加属性") + "</font>";
            this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "</font>";
            this.youshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "</font>";
         }
         else
         {
            this.miaoshu.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.name + "<br>" + LanResManager.getLanCommonTextWords("当前等级：") + param1.dengji + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加属性") + "</font>";
            this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + param1.act + "<br>" + LanResManager.getLanCommonTextWords("闪避：+") + param1.shanbi + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param1.shengming + "</font>";
            this.youshuxing.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：+") + param1.def + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param1.neili + "<br>" + LanResManager.getLanCommonTextWords("暴击：+") + param1.baoji + "</font>";
         }
      }
   }
}

