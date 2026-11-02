package com.tgame.shell.view.components.attribute
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TAVenationPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class TAVenationCanvas extends Sprite
   {
      
      public var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      public var bgImg1:Bitmap;
      
      private var isZhenLong:Boolean;
      
      private var allContainer:Sprite;
      
      private var venationContainer:Sprite;
      
      private var allBtn:SecondButton;
      
      private var yangWeiBtn:SecondButton;
      
      private var yinWeiBtn:SecondButton;
      
      private var yangQiaoBtn:SecondButton;
      
      private var yinQiaoBtn:SecondButton;
      
      private var daiBtn:SecondButton;
      
      private var congBtn:SecondButton;
      
      private var renBtn:SecondButton;
      
      private var duBtn:SecondButton;
      
      private var progressBar:ColorBar;
      
      private var yangweiMai:MovieClip;
      
      private var yinweiMai:MovieClip;
      
      private var yangqiaoMai:MovieClip;
      
      private var yinqiaoMai:MovieClip;
      
      private var daiMai:MovieClip;
      
      private var congMai:MovieClip;
      
      private var renMai:MovieClip;
      
      private var duMai:MovieClip;
      
      private var venationTip:FTextArea;
      
      private var addValueTip:FTextArea;
      
      public var impactPoint:ImpactPointPanel;
      
      private var container:Sprite;
      
      private var tips1:FTextArea;
      
      private var tips2:FTextArea;
      
      private var links:FLabel;
      
      private var tips3:FTextArea;
      
      private var titleImg:Bitmap;
      
      private var markImg:Bitmap;
      
      private var pointAttribute:FTextArea;
      
      private var progressLabel:FLabel;
      
      public function TAVenationCanvas()
      {
         super();
         this.venationContainer = new Sprite();
         addChild(this.venationContainer);
         this.bgImg1 = new Bitmap();
         this.bgImg1.name = "ui.char.attribute.venation.point.ui";
         this.venationContainer.addChild(this.bgImg1);
         this.allContainer = new Sprite();
         addChild(this.allContainer);
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.attribute.venation.ui";
         this.allContainer.addChild(this.bgImg);
         this.init();
      }
      
      private function init() : void
      {
         var lodImg:DisplayObject;
         var pointIco:Bitmap;
         var ft:FTextArea;
         var i:int = 0;
         var len:int = 0;
         this.yangweiMai = StaticValue.getMCByClassName("ui.attribute.venation.yangwei") as MovieClip;
         this.venationContainer.addChild(this.yangweiMai);
         this.yangweiMai.x = 91;
         this.yangweiMai.y = 5;
         len = this.yangweiMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.yangweiMai.getChildAt(i) is MovieClip)
            {
               (this.yangweiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.yangweiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.yinweiMai = StaticValue.getMCByClassName("ui.attribute.venation.yinwei") as MovieClip;
         this.venationContainer.addChild(this.yinweiMai);
         this.yinweiMai.x = 91;
         this.yinweiMai.y = 5;
         len = this.yinweiMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.yinweiMai.getChildAt(i) is MovieClip)
            {
               (this.yinweiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.yinweiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.yangqiaoMai = StaticValue.getMCByClassName("ui.attribute.venation.yangqiao") as MovieClip;
         this.venationContainer.addChild(this.yangqiaoMai);
         this.yangqiaoMai.x = 91;
         this.yangqiaoMai.y = 5;
         len = this.yangqiaoMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.yangqiaoMai.getChildAt(i) is MovieClip)
            {
               (this.yangqiaoMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.yangqiaoMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.yinqiaoMai = StaticValue.getMCByClassName("ui.attribute.venation.yinqiao") as MovieClip;
         this.venationContainer.addChild(this.yinqiaoMai);
         this.yinqiaoMai.x = 91;
         this.yinqiaoMai.y = 5;
         len = this.yinqiaoMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.yinqiaoMai.getChildAt(i) is MovieClip)
            {
               (this.yinqiaoMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.yinqiaoMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.daiMai = StaticValue.getMCByClassName("ui.attribute.venation.dai") as MovieClip;
         this.venationContainer.addChild(this.daiMai);
         this.daiMai.x = 91;
         this.daiMai.y = 5;
         len = this.daiMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.daiMai.getChildAt(i) is MovieClip)
            {
               (this.daiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.daiMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.congMai = StaticValue.getMCByClassName("ui.attribute.venation.cong") as MovieClip;
         this.venationContainer.addChild(this.congMai);
         this.congMai.x = 91;
         this.congMai.y = 5;
         len = this.congMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.congMai.getChildAt(i) is MovieClip)
            {
               (this.congMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.congMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.renMai = StaticValue.getMCByClassName("ui.attribute.venation.ren") as MovieClip;
         this.venationContainer.addChild(this.renMai);
         this.renMai.x = 91;
         this.renMai.y = 5;
         len = this.renMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.renMai.getChildAt(i) is MovieClip)
            {
               (this.renMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.renMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.duMai = StaticValue.getMCByClassName("ui.attribute.venation.du") as MovieClip;
         this.venationContainer.addChild(this.duMai);
         this.duMai.x = 91;
         this.duMai.y = 5;
         len = this.duMai.numChildren;
         i = 0;
         while(i < len)
         {
            if(this.duMai.getChildAt(i) is MovieClip)
            {
               (this.duMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OVER,this.onPointMouse);
               (this.duMai.getChildAt(i) as MovieClip).addEventListener(MouseEvent.MOUSE_OUT,this.onPointMouse);
            }
            i++;
         }
         this.allBtn = new SecondButton();
         this.allBtn.label = LanResManager.getLanTextWords(this,"配偶总揽");
         addChild(this.allBtn);
         this.allBtn.x = 12;
         this.allBtn.y = 8;
         this.allBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yangWeiBtn = new SecondButton();
         this.yangWeiBtn.label = LanResManager.getLanTextWords(this,"配偶阳维脉");
         addChild(this.yangWeiBtn);
         this.yangWeiBtn.x = 12;
         this.yangWeiBtn.y = 33;
         this.yangWeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yinWeiBtn = new SecondButton();
         this.yinWeiBtn.label = LanResManager.getLanTextWords(this,"配偶阴维脉");
         addChild(this.yinWeiBtn);
         this.yinWeiBtn.x = 12;
         this.yinWeiBtn.y = 58;
         this.yinWeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yangQiaoBtn = new SecondButton();
         this.yangQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶阳跷脉");
         addChild(this.yangQiaoBtn);
         this.yangQiaoBtn.x = 12;
         this.yangQiaoBtn.y = 83;
         this.yangQiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yinQiaoBtn = new SecondButton();
         this.yinQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶阴跷脉");
         addChild(this.yinQiaoBtn);
         this.yinQiaoBtn.x = 12;
         this.yinQiaoBtn.y = 108;
         this.yinQiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.daiBtn = new SecondButton();
         this.daiBtn.label = LanResManager.getLanTextWords(this,"配偶带脉");
         addChild(this.daiBtn);
         this.daiBtn.x = 12;
         this.daiBtn.y = 133;
         this.daiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.congBtn = new SecondButton();
         this.congBtn.label = LanResManager.getLanTextWords(this,"配偶冲脉");
         addChild(this.congBtn);
         this.congBtn.x = 12;
         this.congBtn.y = 158;
         this.congBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.renBtn = new SecondButton();
         this.renBtn.label = LanResManager.getLanTextWords(this,"配偶任脉");
         addChild(this.renBtn);
         this.renBtn.x = 12;
         this.renBtn.y = 183;
         this.renBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.duBtn = new SecondButton();
         this.duBtn.label = LanResManager.getLanTextWords(this,"配偶督脉");
         addChild(this.duBtn);
         this.duBtn.x = 12;
         this.duBtn.y = 208;
         this.duBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.titleImg = StaticValue.getBitmapByClassName("ui.attribute.venation.jingmaijingdu");
         this.allContainer.addChild(this.titleImg);
         this.titleImg.x = 238 - this.titleImg.width / 2;
         this.titleImg.y = 7;
         this.progressBar = new ColorBar(5,273,5,false);
         this.allContainer.addChild(this.progressBar);
         this.progressBar.x = 108;
         this.progressBar.y = 28;
         this.progressLabel = new FLabel();
         with(this.progressLabel)
         {
            x = 230;
            y = 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.progressLabel);
         this.tips1 = new FTextArea();
         with(this.tips1)
         {
            width = 350;
            height = 55;
            x = 94;
            y = 38;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.allContainer.addChild(this.tips1);
         this.tips2 = new FTextArea();
         with(this.tips2)
         {
            width = 350;
            height = 95;
            x = 94;
            y = 94;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"人体的各大经脉穴位",[StaticValue.GREEN_HTML],false) + "</textformat>";
         }
         this.allContainer.addChild(this.tips2);
         this.tips3 = new FTextArea();
         with(this.tips3)
         {
            width = 350;
            height = 65;
            x = 94;
            y = 191;
            wordWrap = true;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.tips3);
         lodImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/venation_long.png",392,102);
         this.allContainer.addChild(lodImg);
         lodImg.x = 5;
         lodImg.y = 260;
         this.markImg = StaticValue.getBitmapByClassName("ui.attribute.venation.zhulongjindu");
         this.allContainer.addChild(this.markImg);
         this.markImg.x = 325;
         this.markImg.y = 328;
         this.container = new Sprite();
         this.allContainer.addChild(this.container);
         this.container.x = 5;
         this.container.y = 260;
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "1";
         pointIco.visible = false;
         pointIco.x = 52;
         pointIco.y = 34;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "2";
         pointIco.visible = false;
         pointIco.x = 58;
         pointIco.y = 55;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "3";
         pointIco.visible = false;
         pointIco.x = 106;
         pointIco.y = 61;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "4";
         pointIco.visible = false;
         pointIco.x = 153;
         pointIco.y = 29;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "5";
         pointIco.visible = false;
         pointIco.x = 205;
         pointIco.y = 30;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "6";
         pointIco.visible = false;
         pointIco.x = 216;
         pointIco.y = 60;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "7";
         pointIco.visible = false;
         pointIco.x = 269;
         pointIco.y = 46;
         this.container.addChild(pointIco);
         pointIco = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point");
         pointIco.name = "8";
         pointIco.visible = false;
         pointIco.x = 318;
         pointIco.y = 33;
         this.container.addChild(pointIco);
         this.venationTip = new FTextArea();
         with(this.venationTip)
         {
            x = 10;
            y = 265;
            width = 298;
            height = 60;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         this.venationContainer.addChild(this.venationTip);
         this.addValueTip = new FTextArea();
         with(this.addValueTip)
         {
            x = 10;
            y = 326;
            width = 389;
            height = 40;
            multiline = true;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         this.venationContainer.addChild(this.addValueTip);
         ft = new FTextArea();
         with(ft)
         {
            x = 225;
            y = 262;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanTextWords(this,"加成属性所需真气",[],false) + "</textformat>";
         }
         this.venationContainer.addChild(ft);
         this.pointAttribute = new FTextArea();
         with(this.pointAttribute)
         {
            x = 294;
            y = 262;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'8\'> <br> <br> </textformat>";
         }
         this.venationContainer.addChild(this.pointAttribute);
         this.setIsZhenLong(true);
      }
      
      private function onPointMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_GET_POINT_ATTRIBUTE,"",param1.target.$name));
               break;
            case MouseEvent.MOUSE_OUT:
               this.pointAttribute.htmlText = "";
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.yangweiMai.initCreate(this._parent,BaseEvent);
         this.yinweiMai.initCreate(this._parent,BaseEvent);
         this.yangqiaoMai.initCreate(this._parent,BaseEvent);
         this.yinqiaoMai.initCreate(this._parent,BaseEvent);
         this.daiMai.initCreate(this._parent,BaseEvent);
         this.congMai.initCreate(this._parent,BaseEvent);
         this.renMai.initCreate(this._parent,BaseEvent);
         this.duMai.initCreate(this._parent,BaseEvent);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.allBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_GETVENATION));
               break;
            case this.yangWeiBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",1));
               break;
            case this.yinWeiBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",2));
               break;
            case this.yangQiaoBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",3));
               break;
            case this.yinQiaoBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",4));
               break;
            case this.daiBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",5));
               break;
            case this.congBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",6));
               break;
            case this.renBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",7));
               break;
            case this.duBtn:
               this._parent.dispatchEvent(new BaseEvent(TAVenationPanel.UI_TA_VENATION_EVENT_CLICK,"",8));
         }
      }
      
      public function setIsZhenLong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.isZhenLong = param1;
         if(param1)
         {
            this.allBtn.label = LanResManager.getLanTextWords(this,"配偶真龙总揽");
            this.yangWeiBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·阳维");
            this.yinWeiBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·阴维");
            this.yangQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·阳跷");
            this.yinQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·阴跷");
            this.daiBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·带脉");
            this.congBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·冲脉");
            this.renBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·任脉");
            this.duBtn.label = LanResManager.getLanTextWords(this,"配偶真龙·督脉");
            this.tips2.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"真龙脉武学巅峰加成",[StaticValue.GREEN_HTML],false) + "</textformat>";
            this.allBtn.x = this.yangWeiBtn.x = this.yinWeiBtn.x = this.yangQiaoBtn.x = this.yinQiaoBtn.x = this.daiBtn.x = this.congBtn.x = this.renBtn.x = this.duBtn.x = 7;
            this.titleImg.bitmapData = StaticValue.getBitmapByClassName("ui.attribute.venation.zhenlongmaijindu").bitmapData;
            this.titleImg.x = 238 - this.titleImg.width / 2;
            _loc3_ = this.container.numChildren;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               (this.container.getChildAt(_loc2_) as Bitmap).bitmapData = StaticValue.getBitmapByClassName("ui.char.attribute.venation.zhenlong.ico.point").bitmapData;
               _loc2_++;
            }
            this.markImg.bitmapData = StaticValue.getBitmapByClassName("ui.attribute.venation.zhenlongjindu").bitmapData;
         }
         else
         {
            this.allBtn.label = LanResManager.getLanTextWords(this,"配偶总揽");
            this.yangWeiBtn.label = LanResManager.getLanTextWords(this,"配偶阳维脉");
            this.yinWeiBtn.label = LanResManager.getLanTextWords(this,"配偶阴维脉");
            this.yangQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶阳跷脉");
            this.yinQiaoBtn.label = LanResManager.getLanTextWords(this,"配偶阳跷脉");
            this.daiBtn.label = LanResManager.getLanTextWords(this,"配偶带脉");
            this.congBtn.label = LanResManager.getLanTextWords(this,"配偶冲脉");
            this.renBtn.label = LanResManager.getLanTextWords(this,"配偶任脉");
            this.duBtn.label = LanResManager.getLanTextWords(this,"配偶督脉");
            this.allBtn.x = this.yangWeiBtn.x = this.yinWeiBtn.x = this.yangQiaoBtn.x = this.yinQiaoBtn.x = this.daiBtn.x = this.congBtn.x = this.renBtn.x = this.duBtn.x = 12;
            this.tips2.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"潜能脉",[StaticValue.GREEN_HTML],false) + "</textformat>";
            this.titleImg.bitmapData = StaticValue.getBitmapByClassName("ui.attribute.venation.jingmaijingdu").bitmapData;
            this.titleImg.x = 238 - this.titleImg.width / 2;
            _loc3_ = this.container.numChildren;
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               (this.container.getChildAt(_loc2_) as Bitmap).bitmapData = StaticValue.getBitmapByClassName("ui.char.attribute.venation.ico.point").bitmapData;
               _loc2_++;
            }
            this.markImg.bitmapData = StaticValue.getBitmapByClassName("ui.attribute.venation.zhulongjindu").bitmapData;
         }
      }
      
      public function setAddValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         this.tips1.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"设置配偶经脉加成点数",[StaticValue.GREEN_HTML,param1,param2,param3,param4,param5,param6,param7],false) + "</textformat>";
      }
      
      public function setExpAddValue(param1:int, param2:Number) : void
      {
         this.tips3.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"设置配偶冲穴经验加成",[StaticValue.YELLOW_HTML,param1,param2],false) + "</textformat>";
      }
      
      public function setPointAttribute(param1:String, param2:String, param3:int) : void
      {
         this.pointAttribute.htmlText = "<textformat leading=\'5\'>" + param1 + "<br>" + param2 + "<br>" + param3 + "</textformat>";
      }
      
      public function showAll(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         this.allContainer.visible = true;
         this.venationContainer.visible = false;
         this.progressLabel.text = param2 + "/" + param3;
         if(this.isZhenLong)
         {
            this.progressBar.setValue((param2 - 172) / (344 - 172) * 100,100);
         }
         else
         {
            this.progressBar.setValue(param2,param3);
         }
         var _loc5_:int = this.container.numChildren;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            this.container.getChildAt(_loc4_).visible = false;
            _loc4_++;
         }
         _loc5_ = int(param1.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            this.container.getChildByName(param1[_loc4_].toString()).visible = true;
            _loc4_++;
         }
      }
      
      public function showYangWei(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶阳维脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙阳维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶阳维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = true;
         this.yangweiMai.initCreate(this._parent,BaseEvent);
         this.yangweiMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showYinWei(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶阴维脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙阴维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶阴维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.yinweiMai.visible = true;
         this.yinweiMai.initCreate(this._parent,BaseEvent);
         this.yinweiMai.setBright(param1);
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showYangQiao(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶阳跷脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙阳跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶阳跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangqiaoMai.initCreate(this._parent,BaseEvent);
         this.yangqiaoMai.setBright(param1);
         this.yangweiMai.visible = false;
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = true;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showYinQiao(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶阴跷脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙阴跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶阴跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.yinqiaoMai.initCreate(this._parent,BaseEvent);
         this.yinqiaoMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = true;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showDai(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶带脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙带脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶带脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.daiMai.initCreate(this._parent,BaseEvent);
         this.daiMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = true;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showCong(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶冲脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙冲脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶冲脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.congMai.initCreate(this._parent,BaseEvent);
         this.congMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = true;
         this.renMai.visible = false;
         this.duMai.visible = false;
      }
      
      public function showRen(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶任脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙任脉加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶任脉加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.renMai.initCreate(this._parent,BaseEvent);
         this.renMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = true;
         this.duMai.visible = false;
      }
      
      public function showDu(param1:int, param2:Boolean, param3:String) : void
      {
         this.allContainer.visible = false;
         this.venationContainer.visible = true;
         this.venationTip.htmlText = LanResManager.getLanTextWords(this,"配偶督脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶真龙督脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(this,"配偶督脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         this.yangweiMai.visible = false;
         this.duMai.initCreate(this._parent,BaseEvent);
         this.duMai.setBright(param1);
         this.yinweiMai.visible = false;
         this.yangqiaoMai.visible = false;
         this.yinqiaoMai.visible = false;
         this.daiMai.visible = false;
         this.congMai.visible = false;
         this.renMai.visible = false;
         this.duMai.visible = true;
      }
   }
}

