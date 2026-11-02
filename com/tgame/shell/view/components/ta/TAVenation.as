package com.tgame.shell.view.components.ta
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.tgame.shell.view.components.attribute.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.getDefinitionByName;
   
   public class TAVenation extends Sprite
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
      
      private var bgCanvas:FCanvas;
      
      private var bgCanvas1:FCanvas;
      
      private var bgCanvas2:FCanvas;
      
      private var qiHaiBtn2:SimpleButton;
      
      private var qiHaiTip:FTextArea;
      
      private var qiHaiTipCanvas:FCanvas;
      
      private var jinduFt:FTextArea;
      
      private var shuxingNum:FTextArea;
      
      private var gongImgObj:Object;
      
      private var lmFta:FTextArea;
      
      private var isLm:Boolean = false;
      
      private var zhuanShiZhenLongFta:FTextArea;
      
      private var fts:FTextArea;
      
      private var tianMingJingTiFta:FTextArea;
      
      private var fts1:FTextArea;
      
      private var yixing:Boolean = false;
      
      private var erxing:Boolean = false;
      
      private var sanxing:Boolean = false;
      
      private var sixing:Boolean = false;
      
      private var wuxing:Boolean = false;
      
      private var liuxing:Boolean = false;
      
      private var qixing:Boolean = false;
      
      private var bg1:DisplayObject;
      
      private var fts2:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var checkGh:FCheckBox;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkill:Skill;
      
      private var kuang1:Bitmap;
      
      private var fts4:FTextArea;
      
      public function TAVenation()
      {
         var line:Bitmap;
         var $class:Class;
         this.gongImgObj = {};
         super();
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jingmai/guanglong.swf");
         this.bg1.x = 2;
         this.bg1.y = 2 + 264;
         this.bg1.visible = false;
         this.bgCanvas = new FCanvas();
         this.bgCanvas.skin = "box";
         addChildAt(this.bgCanvas,0);
         this.bgCanvas.width = 403;
         this.bgCanvas.height = 368;
         this.bgCanvas1 = new FCanvas();
         this.bgCanvas1.skin = "box_transparence";
         this.bgCanvas1.width = 310;
         this.bgCanvas1.height = 256;
         addChild(this.bgCanvas1);
         this.bgCanvas1.x = 90;
         this.bgCanvas1.y = 3;
         this.bgCanvas2 = new FCanvas();
         this.bgCanvas2.skin = "box";
         addChild(this.bgCanvas2);
         this.bgCanvas2.width = 398;
         this.bgCanvas2.height = 107;
         this.bgCanvas2.x = 2;
         this.bgCanvas2.y = 258;
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 300;
         line.x = 97;
         line.y = 90;
         line = new Bitmap();
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 300;
         line.x = 97;
         line.y = 185;
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
         $class = getDefinitionByName("ui.qihai.btn.complete") as Class;
         this.qiHaiBtn2 = new $class() as SimpleButton;
         this.qiHaiBtn2.x = 285;
         this.qiHaiBtn2.y = 8;
         addChild(this.qiHaiBtn2);
         this.qiHaiBtn2.addEventListener(MouseEvent.MOUSE_OVER,this.qiHaiBtnMouseEvent);
         this.qiHaiBtn2.addEventListener(MouseEvent.MOUSE_OUT,this.qiHaiBtnMouseEvent);
         this.qiHaiBtn2.visible = false;
         this.qiHaiTipCanvas = new FCanvas();
         this.qiHaiTipCanvas.skin = "backGroud";
         this.qiHaiTip = new FTextArea();
         with(this.qiHaiTip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.qiHaiTipCanvas.addChild(this.qiHaiTip);
      }
      
      private function init() : void
      {
         var bg:Bitmap;
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
         addChild(this.allBtn);
         this.allBtn.x = 12;
         this.allBtn.y = 8;
         this.allBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yangWeiBtn = new SecondButton();
         addChild(this.yangWeiBtn);
         this.yangWeiBtn.x = 12;
         this.yangWeiBtn.y = 33;
         this.yangWeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yinWeiBtn = new SecondButton();
         addChild(this.yinWeiBtn);
         this.yinWeiBtn.x = 12;
         this.yinWeiBtn.y = 58;
         this.yinWeiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yangQiaoBtn = new SecondButton();
         addChild(this.yangQiaoBtn);
         this.yangQiaoBtn.x = 12;
         this.yangQiaoBtn.y = 83;
         this.yangQiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yinQiaoBtn = new SecondButton();
         addChild(this.yinQiaoBtn);
         this.yinQiaoBtn.x = 12;
         this.yinQiaoBtn.y = 108;
         this.yinQiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.daiBtn = new SecondButton();
         addChild(this.daiBtn);
         this.daiBtn.x = 12;
         this.daiBtn.y = 133;
         this.daiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.congBtn = new SecondButton();
         addChild(this.congBtn);
         this.congBtn.x = 12;
         this.congBtn.y = 158;
         this.congBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.renBtn = new SecondButton();
         addChild(this.renBtn);
         this.renBtn.x = 12;
         this.renBtn.y = 183;
         this.renBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.duBtn = new SecondButton();
         addChild(this.duBtn);
         this.duBtn.x = 12;
         this.duBtn.y = 208;
         this.duBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.titleImg = StaticValue.getBitmapByClassName("ui.attribute.venation.jingmaijingdu");
         this.allContainer.addChild(this.titleImg);
         this.titleImg.x = 238 - this.titleImg.width / 2;
         this.titleImg.y = 7;
         bg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         addChildAt(bg,0);
         bg.x = 104;
         bg.y = 24;
         this.progressBar = new ColorBar(5,273,5,false);
         this.allContainer.addChild(this.progressBar);
         this.progressBar.x = 108;
         this.progressBar.y = 27;
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
            width = 300;
            height = 60;
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
            width = 300;
            height = 95;
            x = 94;
            y = 90;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.tips2);
         this.tianMingJingTiFta = new FTextArea();
         this.tianMingJingTiFta.multiline = true;
         this.tianMingJingTiFta.filters = StaticValue.filter;
         this.tianMingJingTiFta.x = 94 + 200;
         this.tianMingJingTiFta.y = 94 + 55;
         this.tianMingJingTiFta.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("天命?晶体属性") + "</u></a></font>";
         ToolTips.createToolTips(this.tianMingJingTiFta,this,function(param1:*, param2:MouseEvent):String
         {
            return "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("天命?晶体：每颗增加攻击2000000及提升经脉进度10点。") + "<br>" + LanResManager.getLanCommonTextWords("天命?晶体每个玩家都最多也可使用9999颗。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用：") + (GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_TIANMINGJINGSHI_ID] == undefined ? 0 : GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_TIANMINGJINGSHI_ID]) + "<br>" + LanResManager.getLanCommonTextWords("王者经脉石：每颗将可以增加10000点经脉进度。") + "<br>" + LanResManager.getLanCommonTextWords("王者经脉石每个玩家都最多也可使用1000颗。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用：") + (GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_WANGZHEJINGMAISHI_ID] == undefined ? 0 : GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_WANGZHEJINGMAISHI_ID]) + "</font></textformat>";
         });
         this.tips3 = new FTextArea();
         with(this.tips3)
         {
            width = 300;
            height = 80;
            x = 94;
            y = 195;
            wordWrap = true;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.tips3);
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
            htmlText = LanResManager.getLanTextWords(Venation,"加成属性所需真气");
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
         this.jinduFt = new FTextArea();
         with(this.jinduFt)
         {
            width = 392;
            height = 100;
            x = 150;
            y = 296;
            wordWrap = true;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.jinduFt);
         this.shuxingNum = new FTextArea();
         with(this.shuxingNum)
         {
            width = 392;
            height = 100;
            x = 32;
            y = 312;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         this.allContainer.addChild(this.shuxingNum);
         this.setIsZhenLong(true);
         this.allContainer.addChild(this.bg1);
         this.lmFta = new FTextArea();
         with(this.lmFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 10;
            y = 270;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("龙脉精元属性未激活");
         }
         ToolTips.createToolTips(this.lmFta,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            _loc3_ += "<textformat leading=\'6\'>";
            if(isLm)
            {
               _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙脉精元已激活") + "<br>" + LanResManager.getLanCommonTextWords("人物经脉增加128888攻击、68888防御、388888血量") + "</font>";
            }
            else
            {
               _loc3_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙脉精元未激活") + "<br>" + LanResManager.getLanCommonTextWords("激活后将可以为人物经脉增加128888攻击、68888防御、388888血量") + "</font>";
            }
            return _loc3_ + "</textformat>";
         });
         this.zhuanShiZhenLongFta = new FTextArea();
         with(this.zhuanShiZhenLongFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 250;
            y = 270;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("转世真龙属性已激活");
            visible = false;
         }
         ToolTips.createToolTips(this.zhuanShiZhenLongFta,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            _loc3_ += "<textformat leading=\'6\'>";
            _loc3_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("转世真龙属性已激活") + "<br>" + LanResManager.getLanCommonTextWords("增加人物攻击4888888、防御3688888、血量48888888 、暴击 5000、闪避5000、所有武功12层") + "</font>";
            return _loc3_ + "</textformat>";
         });
         this.fts = new FTextArea();
         this.fts.x = 10;
         this.fts.y = 345;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 200;
         this.fts.height = 50;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("天龙无相功法(未激活)");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击、防御、血量、暴击、闪避所有武功提升十二层") + "<br>" + LanResManager.getLanCommonTextWords("天龙无相神功功法：当玩家受到定身、点穴时才可触发天龙无相神功功法。此功法可使自身在") + "<br>" + LanResManager.getLanCommonTextWords("受困于点穴以及定身时，将伤害以反弹于攻击者身上，是造成较高攻击伤害的一项绝世武学。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 290;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("七星龙珠(已激活)");
         this.allContainer.addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>";
            if(yixing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("一星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：10888亿、防御10888亿、血量10888亿、所有武功提升 100000层") + "<br>";
            }
            if(erxing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("二星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：11888亿、防御11888亿、血量11888亿、所有武功提升 110000层") + "<br>";
            }
            if(sanxing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("三星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：12888亿、防御12888亿、血量12888亿、所有武功提升 120000层") + "<br>";
            }
            if(sixing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("四星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：13888亿、防御13888亿、血量13888亿、所有武功提升 130000层") + "<br>";
            }
            if(wuxing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("五星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：14888亿、防御14888亿、血量14888亿、所有武功提升 140000层") + "<br>";
            }
            if(liuxing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("六星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：15888亿、防御15888亿、血量15888亿、所有武功提升 150000层") + "<br>";
            }
            if(qixing)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("七星珠(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：16888亿、防御16888亿、血量16888亿、所有武功提升 160000层") + "<br>";
            }
            return _loc1_ + "</font></textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10 + 255 + 40;
         this.fts2.y = 7 + 20 + 105 + 59;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("龍皇 ");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击12888888889000 防御10888888889000 血量13888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击 88888闪避 88888所有武功3000000层") + "<br>" + LanResManager.getLanCommonTextWords("龍皇金身：激活龍皇的玩家可获得龍皇金身外观特效，且人物还将拥有龍皇的主宰权。") + "<br>" + LanResManager.getLanCommonTextWords("龍皇咆哮：神魔世界， 一代修真者穿越成为了龍族，幻化成龍。龍皇将拥有所有骑兽") + "<br>" + LanResManager.getLanCommonTextWords("中不一样的身体且附龍族守护。攻击时100%触发龍皇咆哮，持续10秒；在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("龍皇将施放金光包裹整个身体，在金光状态下，每移动一次地动山摇，所有在龍皇5") + "<br>" + LanResManager.getLanCommonTextWords("格范围内的所有玩家都将被威慑击退；每跳跃一次，所有在龍皇5格范围内的所有玩") + "<br>" + LanResManager.getLanCommonTextWords("家都将受金光穿刺，瞬间停顿原地，持续10秒；在金光状态下，自身将不受任何。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20 + 105;
         this.checkZq.enabled = false;
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255 + 40 - 295 + 100 + 215;
         this.fts3.y = 7 + 20 + 105 + 59 + 20 + 20 + 3 - 230 + 35;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("浴血光环 ");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("光环护罩：激活浴血光环的玩家，头顶上可获得永久光环护罩效果和特效。") + "<br>" + LanResManager.getLanCommonTextWords("护罩反噬：攻击时有几率触发护罩反噬，持续10秒；在此状态下，可瞬间") + "<br>" + LanResManager.getLanCommonTextWords("反噬对手定身，在BUFF接下来的每一次自身将进入无敌状态；且在此状态") + "<br>" + LanResManager.getLanCommonTextWords("下，每攻击一次对手，将附加反噬对手瞬间使其定身于原地，无法移动，") + "<br>" + LanResManager.getLanCommonTextWords("持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkGh = new FCheckBox();
         addChild(this.checkGh);
         this.checkGh.x = 256 + 117 - 10 - 295 + 100 + 215;
         this.checkGh.y = 7 + 20 + 105 + 59 + 20 + 23 - 230 + 35;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 25 + 2 + 324 + 5;
         this.mainSkillContainer.y = 160 + 2 + 35 - 10;
         addChild(this.mainSkillContainer);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 40 - 295 + 100 + 215 - 3;
         this.fts4.y = 7 + 20 + 105 + 59 + 20 + 20 + 3 - 230 + 35;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = "困兽狱场秘籍 ";
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层全属性提升1000%" + "<br>" + "特殊技能：玩家激活困兽狱场，获得困兽狱场主动技能；锁定对手后释放困兽狱场技能，" + "<br>" + "对手周围突现枷锁，犹如监狱一般，被困其中，无法行动和攻击对手。持续10秒，冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onPointMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_GET_POINT_ATTRIBUTE,"",param1.target.$name));
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
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.GETVENATION));
               break;
            case this.yangWeiBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",1));
               break;
            case this.yinWeiBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",2));
               break;
            case this.yangQiaoBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",3));
               break;
            case this.yinQiaoBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",4));
               break;
            case this.daiBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",5));
               break;
            case this.congBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",6));
               break;
            case this.renBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",7));
               break;
            case this.duBtn:
               this._parent.dispatchEvent(new BaseEvent(TargetAttribute.UI_TA_VENATION_EVENT_CLICK,"",8));
         }
      }
      
      public function setIsZhenLong(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this.isZhenLong = param1;
         if(param1)
         {
            this.allBtn.label = LanResManager.getLanTextWords(Venation,"真龙总揽");
            this.yangWeiBtn.label = LanResManager.getLanTextWords(Venation,"真龙·阳维");
            this.yinWeiBtn.label = LanResManager.getLanTextWords(Venation,"真龙·阴维");
            this.yangQiaoBtn.label = LanResManager.getLanTextWords(Venation,"真龙·阳跷");
            this.yinQiaoBtn.label = LanResManager.getLanTextWords(Venation,"真龙·阴跷");
            this.daiBtn.label = LanResManager.getLanTextWords(Venation,"真龙·带脉");
            this.congBtn.label = LanResManager.getLanTextWords(Venation,"真龙·冲脉");
            this.renBtn.label = LanResManager.getLanTextWords(Venation,"真龙·任脉");
            this.duBtn.label = LanResManager.getLanTextWords(Venation,"真龙·督脉");
            this.tips2.htmlText = LanResManager.getLanTextWords(Venation,"真龙脉武学巅峰加成",[StaticValue.GREEN_HTML]);
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
            this.allBtn.label = LanResManager.getLanTextWords(Venation,"总揽");
            this.yangWeiBtn.label = LanResManager.getLanTextWords(Venation,"阳维脉");
            this.yinWeiBtn.label = LanResManager.getLanTextWords(Venation,"阴维脉");
            this.yangQiaoBtn.label = LanResManager.getLanTextWords(Venation,"阳跷脉");
            this.yinQiaoBtn.label = LanResManager.getLanTextWords(Venation,"阴跷脉");
            this.daiBtn.label = LanResManager.getLanTextWords(Venation,"带脉");
            this.congBtn.label = LanResManager.getLanTextWords(Venation,"冲脉");
            this.renBtn.label = LanResManager.getLanTextWords(Venation,"任脉");
            this.duBtn.label = LanResManager.getLanTextWords(Venation,"督脉");
            this.allBtn.x = this.yangWeiBtn.x = this.yinWeiBtn.x = this.yangQiaoBtn.x = this.yinQiaoBtn.x = this.daiBtn.x = this.congBtn.x = this.renBtn.x = this.duBtn.x = 12;
            this.tips2.htmlText = LanResManager.getLanTextWords(Venation,"经脉穴位的潜能提示",[StaticValue.GREEN_HTML]);
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
         this.tips1.htmlText = LanResManager.getLanTextWords(Venation,"设置经脉加成点数",[StaticValue.GREEN_HTML,param1,param2,param3,param4,param5,param6,param7]);
         this.setJiHuo();
      }
      
      public function isZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.checkZq.selectState = param1;
         this.checkGh.selectState = param1;
      }
      
      public function setJiHuo() : void
      {
         this.yixing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_YIXINGZHU_ID];
         this.erxing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_ERXINGZHU_ID];
         this.sanxing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_SANXINGZHU_ID];
         this.sixing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_SIXINGZHU_ID];
         this.wuxing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_WUXINGZHU_ID];
         this.liuxing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_LIUXINGZHU_ID];
         this.qixing = GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_QIXINGZHU_ID];
         if(this.yixing || this.erxing || this.sanxing || this.sixing || this.wuxing || this.liuxing || this.qixing)
         {
            this.fts1.visible = true;
         }
         else
         {
            this.fts1.visible = false;
         }
         if(this.yixing && this.erxing && this.sanxing && this.sixing && this.wuxing && this.liuxing && this.qixing)
         {
            this.bg1.visible = true;
         }
         else
         {
            this.bg1.visible = false;
         }
         if(GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_LONGHUANG_ID])
         {
            this.fts2.visible = true;
            this.checkZq.visible = true;
         }
         else
         {
            this.fts2.visible = false;
            this.checkZq.visible = false;
         }
         if(GameState.dictTargetStatus[SpecialGoodsID.JINGMAI_YUXUEGUANGHUAN])
         {
            this.fts3.visible = true;
            this.checkGh.visible = true;
         }
         else
         {
            this.fts3.visible = false;
            this.checkGh.visible = false;
         }
         this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.DIZI_JINGMAI_KUNSHOU_ID];
         if(GameState.dictTargetStatus[SpecialGoodsID.DIZI_JINGMAI_KUNSHOU_ID])
         {
            this.setSkillJiHuo(200369,true);
         }
      }
      
      public function setExpAddValue(param1:int, param2:Number) : void
      {
         this.tips3.htmlText = LanResManager.getLanTextWords(Venation,"设置冲穴经验加成",[StaticValue.YELLOW_HTML,param1,param2]);
      }
      
      public function setPointAttribute(param1:String, param2:String, param3:int) : void
      {
         this.pointAttribute.htmlText = "<textformat leading=\'8\'>" + param1 + "<br>" + param2 + "<br>" + param3 + "</textformat>";
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"阳维脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙阳维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"阳维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"阴维脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙阴维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"阴维脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"阳跷脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙阳跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"阳跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"阴跷脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙阴跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"阴跷脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"带脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙带脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"带脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"冲脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙冲脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"冲脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"任脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙任脉加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"任脉加成",[param3,StaticValue.ORANGE_HTML]);
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
         this.venationTip.htmlText = LanResManager.getLanTextWords(Venation,"督脉简介");
         if(this.isZhenLong)
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"真龙督脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
         }
         else
         {
            this.addValueTip.htmlText = LanResManager.getLanTextWords(Venation,"督脉奖励加成",[param3,StaticValue.ORANGE_HTML]);
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
      
      private function qiHaiBtnMouseEvent(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.showQiHaiTip();
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.qiHaiTipCanvas.parent != null)
               {
                  this.qiHaiTipCanvas.parent.removeChild(this.qiHaiTipCanvas);
               }
               this.qiHaiTip.removeEventListener(MouseEvent.MOUSE_MOVE,this.qiHaiBtnMouseEvent);
         }
      }
      
      private function showQiHaiTip() : void
      {
         addChild(this.qiHaiTipCanvas);
         this.qiHaiTipCanvas.width = this.qiHaiTip.width + 4;
         this.qiHaiTipCanvas.height = this.qiHaiTip.height + 4;
         this.qiHaiTipCanvas.x = mouseX + 15;
         this.qiHaiTipCanvas.y = mouseY + 25;
      }
      
      public function setBtnType(param1:Boolean, param2:Boolean = false, param3:String = "") : void
      {
         this.qiHaiBtn2.visible = param1;
         if(param1)
         {
            if(param2)
            {
               this.qiHaiBtn2.visible = true;
               this.qiHaiBtn2.enabled = false;
            }
            else
            {
               this.qiHaiBtn2.visible = false;
               this.qiHaiBtn2.enabled = false;
            }
            this.qiHaiTip.htmlText = param3;
         }
      }
      
      public function setIsHuti(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:int) : void
      {
         var _loc11_:DisplayObject = null;
         var _loc12_:String = null;
         if(param1)
         {
            if(this.gongImgObj[1] != null)
            {
               this.allContainer.removeChild(this.gongImgObj[1]);
            }
            if(this.gongImgObj[2] != null)
            {
               _loc11_ = this.gongImgObj[2];
            }
            else
            {
               _loc11_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/venation_long2.jpg",392,102);
               this.gongImgObj[2] = _loc11_;
            }
            this.gongImgObj[1] = null;
            this.jinduFt.visible = true;
            this.shuxingNum.visible = true;
            this.jinduFt.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("真龙护体激活进度：") + param2 + "%" + "</textformat>";
            _loc12_ = "";
            _loc12_ = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("攻击：") + param3 + "  " + LanResManager.getLanCommonTextWords("防御：") + param4 + "  " + LanResManager.getLanCommonTextWords("血量：") + param5 + "  " + LanResManager.getLanCommonTextWords("暴击：") + param6 + "  " + LanResManager.getLanCommonTextWords("闪避：") + param7 + "<br>";
            if(param8)
            {
               _loc12_ += "     " + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("真龙全通激活隐藏属性100%免疫弹指神通技能") + "</font>";
            }
            else
            {
               _loc12_ += "     " + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("真龙全通激活隐藏属性100%免疫弹指神通技能") + "</font>";
            }
            _loc12_ += "</textformat>";
            this.shuxingNum.htmlText = _loc12_;
         }
         else
         {
            if(this.gongImgObj[2] != null)
            {
               this.allContainer.removeChild(this.gongImgObj[2]);
            }
            if(this.gongImgObj[1] != null)
            {
               _loc11_ = this.gongImgObj[1];
            }
            else
            {
               _loc11_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/venation_long.png",392,102);
               this.gongImgObj[1] = _loc11_;
            }
            this.gongImgObj[2] = null;
            this.jinduFt.visible = false;
            this.shuxingNum.visible = false;
         }
         this.allContainer.addChildAt(_loc11_,0);
         _loc11_.x = 5;
         _loc11_.y = 260;
         if(param9)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("天龙无相功法(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("天龙无相功法(未激活)");
         }
         this.tips2.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("每使用一颗经脉突破晶石可以提升人物攻击：1000000") + "<br>" + LanResManager.getLanCommonTextWords("使用经脉突破晶石必须真龙经脉全通。") + LanResManager.getLanCommonTextWords("每个玩家必须使用满9999颗经脉突破晶石才能开始使用天命?晶体。") + "<br>" + LanResManager.getLanCommonTextWords("当前经脉玄关已经突破") + param10 + LanResManager.getLanCommonTextWords("层") + "<br>" + LanResManager.getLanCommonTextWords("突破提升经脉进度将影响江湖榜中的经脉进度榜。") + "</font>";
      }
      
      public function setLongmaiJingyuan(param1:Boolean) : void
      {
         this.isLm = param1;
         if(param1)
         {
            this.lmFta.textColor = StaticValue.GREEN;
            this.lmFta.htmlText = LanResManager.getLanCommonTextWords("龙脉精元属性已激活");
         }
         else
         {
            this.lmFta.textColor = StaticValue.RED;
            this.lmFta.htmlText = LanResManager.getLanCommonTextWords("龙脉精元属性未激活");
         }
      }
      
      public function setZhuanshiZhenlong(param1:Boolean) : void
      {
         if(param1)
         {
            this.zhuanShiZhenLongFta.visible = true;
         }
         else
         {
            this.zhuanShiZhenLongFta.visible = false;
         }
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.mainSkillContainer.addChild(this.kuang1);
         this.kuang1.x = -2;
         this.kuang1.y = -2;
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
         }
         else
         {
            this.mainSkill.isLearn = 0;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
   }
}

