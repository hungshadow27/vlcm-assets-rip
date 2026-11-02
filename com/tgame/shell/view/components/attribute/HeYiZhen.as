package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.heYiZhen.model.info.HeYiZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class HeYiZhen extends Sprite
   {
      
      public static const UI_HEYIZHEN_GUANBI_CLICK:String = "UI_HEYIZHEN_GUANBI_CLICK";
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var bg0:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var tf:TextFormat;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var buzhenBtn:SmallButton;
      
      private var heyizhenTupo:HeYiZhenTupoCanvas;
      
      private var xunzhang:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var zuoXiShu:FTextArea;
      
      private var youXiShu:FTextArea;
      
      private var zuoMAX:FTextArea;
      
      private var youMAX:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var ZHENFA_MAX:int = 8;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public var buzhenSpr:Sprite;
      
      private var item:ItemFace;
      
      private var kuang:Bitmap;
      
      private var bg9:F9GridBitmap;
      
      private var jinengSpr:Sprite;
      
      private var tishi:FTextArea;
      
      private var fts1:FTextArea;
      
      private var baofaBtn:SmallButton;
      
      private var baofafts1:FTextArea;
      
      public var baoFaCiShu:int = 0;
      
      private var fts2:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var fujia:FTextArea;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      public function HeYiZhen()
      {
         var jingang:FTextArea;
         var fujiashuxing:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var i:int = 0;
         var n:int = 0;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 265 - 2 - 1 - 13 - 1;
         box.width = 403;
         box.height = 41 + 10;
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg9 = Tools.get9GridBitmpByName("tianmenzhen9_bg");
         this.bg9.width = 271;
         this.bg9.height = 248;
         this.bg9.x = 1;
         this.bg9.y = 1;
         this.bgSpr.addChild(this.bg9);
         i = 0;
         while(i < 3)
         {
            n = 0;
            while(n < 3)
            {
               this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianmenzhen/kuang.swf");
               this.bg.visible = true;
               this.bg.x = 30 + 73 * i;
               this.bg.y = 10 + 73 * n;
               this.bgSpr.addChild(this.bg);
               n++;
            }
            i++;
         }
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.buzhenSpr = new Sprite();
         with(this.buzhenSpr)
         {
            x = 30 + 2;
            y = 10 + 2;
         }
         addChild(this.buzhenSpr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 245 + 35 - 12 + 10;
         this.previousButton.y = 155 + 25;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 45 + 11;
         this.cengshu.height = 17;
         this.cengshu.x = this.previousButton.x + this.previousButton.width + 15 - 12;
         this.cengshu.y = 155 + 25;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = this.cengshu.x + this.cengshu.width;
         this.nextButton.y = 155 + 25;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23 - 14 + 1 + 15 - 5;
         this.lingWuBtn.y = 195 - 1 - 5 + 10 + 23 - 7;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buzhenBtn = new SmallButton();
         this.buzhenBtn.label = LanResManager.getLanCommonTextWords("布阵（3）");
         addChild(this.buzhenBtn);
         this.buzhenBtn.x = 335 - 23 - 14 + 1 + 15 - 5 - 122;
         this.buzhenBtn.y = 195 - 1 - 5 + 10 + 23 - 7 + 25 - 13;
         this.buzhenBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.buzhenBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.buzhenBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         i = 0;
         while(i < 5)
         {
            this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(this.kuang);
            this.kuang.x = 160 + 45 * i + 17;
            this.kuang.y = 266 - 2 - 1 - 10;
            i++;
         }
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 160 + 2;
         this.jinengSpr.y = 266 - 2 - 1 - 10 + 2;
         addChild(this.jinengSpr);
         jingang = new FTextArea();
         addChild(jingang);
         jingang.multiline = true;
         jingang.autoSize = TextFieldAutoSize.CENTER;
         jingang.wordWrap = true;
         jingang.width = 150;
         jingang.height = 30;
         jingang.x = 270 + 15 + 15;
         jingang.y = 12;
         jingang.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("《鹤翼阵》") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160 - 20 - 18;
         this.miaoshu.height = 120;
         this.miaoshu.x = 230 + 30 + 18;
         this.miaoshu.y = 40;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("由真武大帝搞出来的") + "</font>";
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 260 + 8 - 2 - 30 + 3 - 13;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            y = check.y + 1;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("将阵法布局显示给其他人");
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         addChild(this.checkLabel);
         this.bg0 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tianmenzhen/pingbijian.swf");
         this.bg0.visible = false;
         this.bg0.x = 1;
         this.bg0.y = 1;
         addChild(this.bg0);
         this.fujia = new FTextArea();
         addChild(this.fujia);
         this.fujia.multiline = true;
         this.fujia.autoSize = TextFieldAutoSize.CENTER;
         this.fujia.wordWrap = true;
         this.fujia.width = 100;
         this.fujia.height = 30;
         this.fujia.x = 10 + 30;
         this.fujia.y = 260 + 8 - 2;
         this.fujia.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以布阵的勋章") + "</font>";
         this.xunzhang = new FTextArea();
         this.xunzhang.multiline = true;
         this.xunzhang.autoSize = TextFieldAutoSize.CENTER;
         this.xunzhang.wordWrap = true;
         this.xunzhang.width = 330;
         this.xunzhang.height = 120;
         this.xunzhang.x = 10;
         this.xunzhang.y = 230 + 50 + 2;
         fujiashuxing = new FTextArea();
         addChild(fujiashuxing);
         fujiashuxing.multiline = true;
         fujiashuxing.autoSize = TextFieldAutoSize.CENTER;
         fujiashuxing.wordWrap = true;
         fujiashuxing.width = 300;
         fujiashuxing.height = 30;
         fujiashuxing.x = 10;
         fujiashuxing.y = 230 + 50 + 2 + 14 + 5;
         fujiashuxing.htmlText = "<font  color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("布阵后属性加成") + "</font>";
         this.tishi = new FTextArea();
         this.tishi.multiline = true;
         this.tishi.filters = StaticValue.filter;
         this.tishi.width = 80;
         this.tishi.height = 25;
         this.tishi.x = 110;
         this.tishi.y = 230 + 50 + 2 + 14 + 5;
         addChild(this.tishi);
         this.tishi.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("属性加成说明") + "</u></a></font>";
         this.tishi.addEventListener(MouseEvent.MOUSE_OVER,this.onTextTip);
         this.tishi.addEventListener(MouseEvent.MOUSE_OUT,this.onTextTip);
         this.zuoshuxing = new FTextArea();
         addChild(this.zuoshuxing);
         this.zuoshuxing.multiline = true;
         this.zuoshuxing.autoSize = TextFieldAutoSize.CENTER;
         this.zuoshuxing.wordWrap = true;
         this.zuoshuxing.width = 120;
         this.zuoshuxing.height = 40;
         this.zuoshuxing.x = 10;
         this.zuoshuxing.y = 310 + 5;
         this.youshuxing = new FTextArea();
         addChild(this.youshuxing);
         this.youshuxing.multiline = true;
         this.youshuxing.autoSize = TextFieldAutoSize.CENTER;
         this.youshuxing.wordWrap = true;
         this.youshuxing.width = 120;
         this.youshuxing.height = 40;
         this.youshuxing.x = 200;
         this.youshuxing.y = 310 + 5;
         this.zuoXiShu = new FTextArea();
         addChild(this.zuoXiShu);
         this.zuoXiShu.multiline = true;
         this.zuoXiShu.autoSize = TextFieldAutoSize.CENTER;
         this.zuoXiShu.wordWrap = true;
         this.zuoXiShu.width = 120;
         this.zuoXiShu.height = 40;
         this.zuoXiShu.x = 130;
         this.zuoXiShu.y = 310 + 5;
         this.youXiShu = new FTextArea();
         addChild(this.youXiShu);
         this.youXiShu.multiline = true;
         this.youXiShu.autoSize = TextFieldAutoSize.CENTER;
         this.youXiShu.wordWrap = true;
         this.youXiShu.width = 120;
         this.youXiShu.height = 40;
         this.youXiShu.x = 320;
         this.youXiShu.y = 310 + 5;
         this.zuoMAX = new FTextArea();
         addChild(this.zuoMAX);
         this.zuoMAX.multiline = true;
         this.zuoMAX.autoSize = TextFieldAutoSize.CENTER;
         this.zuoMAX.wordWrap = true;
         this.zuoMAX.width = 120;
         this.zuoMAX.height = 40;
         this.zuoMAX.x = 160;
         this.zuoMAX.y = 310 + 5;
         this.youMAX = new FTextArea();
         addChild(this.youMAX);
         this.youMAX.multiline = true;
         this.youMAX.autoSize = TextFieldAutoSize.CENTER;
         this.youMAX.wordWrap = true;
         this.youMAX.width = 120;
         this.youMAX.height = 40;
         this.youMAX.x = 350;
         this.youMAX.y = 310 + 5;
         this.heyizhenTupo = new HeYiZhenTupoCanvas();
         addChild(this.heyizhenTupo);
         this.heyizhenTupo.x = 138;
         this.heyizhenTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,500,390);
            endFill();
         }
         this.heyizhenTupo.mask = $mask;
         addEventListener(UI_HEYIZHEN_GUANBI_CLICK,this.aa1);
         this.fts1 = new FTextArea();
         this.fts1.x = 110 + 90;
         this.fts1.y = 230 + 50 + 2 + 14 + 4;
         this.fts1.textColor = StaticValue.RED;
         this.fts1.width = 170;
         this.fts1.height = 20;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888 防御6888888 血量18888888 暴击888 闪避888") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.baofafts1 = new FTextArea();
         this.baofafts1.x = 200;
         this.baofafts1.y = 350 - 3;
         this.baofafts1.textColor = StaticValue.GREEN;
         this.baofafts1.htmlText = LanResManager.getLanCommonTextWords("鹤翼爆发属性加成");
         this.baofafts1.visible = true;
         addChild(this.baofafts1);
         ToolTips.createToolTips(this.baofafts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击3000000000 防御1888888888 暴击2888 闪避2888血量3088888888、所有武功提升2888层") + "<br></font>";
            if(baoFaCiShu >= 1)
            {
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("鹤翼阵已经爆发") + baoFaCiShu + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("暴击") + 1000 * baoFaCiShu + LanResManager.getLanCommonTextWords("，闪避") + 1000 * baoFaCiShu + LanResManager.getLanCommonTextWords("，所有武功提升") + 10 * baoFaCiShu + LanResManager.getLanCommonTextWords("层 ，") + "</font>";
            }
            return _loc1_ + "</textformat>";
         });
         this.baofaBtn = new SmallButton();
         this.baofaBtn.label = LanResManager.getLanCommonTextWords("鹤翼爆发");
         addChild(this.baofaBtn);
         this.baofaBtn.x = 200 + 130;
         this.baofaBtn.y = 350 - 3;
         this.baofaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         i = 0;
         while(i < 4)
         {
            this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.kuangSpr.addChild(this.kuangHD);
            this.kuangHD.x = 10 + 40 * i;
            this.kuangHD.y = 266 - 2 - 1 - 10;
            i++;
         }
         this.fts2 = new FTextArea();
         this.fts2.x = 110 + 90 + 85;
         this.fts2.y = 348 - 206;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 120;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("阵中大将（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：当阵法满值时，阵法的属性加成将提升500%，所有武功额外提升500000层。（镶嵌4个勋章后，可获得特殊技能）") + "<br>" + LanResManager.getLanCommonTextWords("鹤翼领域：攻击时，有几率触发鹤翼领域，在一定范围内使对手受困于阵中无法离开此阵，只能原地跳跃，同时受到领域压制，") + "<br>" + LanResManager.getLanCommonTextWords("每次跳跃损失50%的当前血量，每跳跃6次时，将造成无法攻击3秒。且鹤翼领域存在期间，有任何玩家进入此阵，必将受到相同") + "<br>" + LanResManager.getLanCommonTextWords("的效果影响，持续时间30秒！") + "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onTextTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.tishi.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性组成：勋章属性之和 * 阵位系数（当前阵法最大翻倍数）") + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.tishi.removeEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_XIAYIYE_CLICK));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_LINGWU_SHOW));
               break;
            case this.buzhenBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_BUZHEN_CLICK));
               break;
            case this.baofaBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_BAOFA_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_XIANSHI_CHECK,"",this.check.selectState));
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.checkLabel.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.buzhenBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target == this.checkLabel)
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("是否愿意将自己的阵法布局显示给其他人") + "</font></textformat>";
                  this.showTip(_loc2_);
               }
               else
               {
                  _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击【布阵】按钮，可以进行布阵，布阵的效果会影响阵法的威力") + "<br>" + LanResManager.getLanCommonTextWords("一天最多可以布阵3次，每天0点将会进行清空刷新") + "</font></textformat>";
                  this.showTip(_loc2_);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.checkLabel.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.buzhenBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.heyizhenTupo._parent2 = param1;
         this.heyizhenTupo._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:HeYiZhenVO) : void
      {
         this.isMain = param1;
         this.setBuZhen(param2.equipArr);
         this.setShuxingJiacheng(param2.xunZhangStr,param2.miaoshu,param2.act,param2.def,param2.hp,param2.mp,param2.baoji,param2.shanbi,param2.xiShu,param2.maxBeiShu);
         this.setZhenFaTiSheng(param2.lookName,param2.lookID,param2.nowID);
         this.setPingBi(param2.isShow);
         this.setcishu(param2.count);
         this.setxunzhang(param2.xunZhangStr);
         this.setHeYiZhenBaoFa(param1,param2.baofa);
         this.setHuodongXunzhang(param1);
      }
      
      private function setHuodongXunzhang(param1:Boolean) : void
      {
         if(param1)
         {
            if(GameState.dictMainStatus[SpecialGoodsID.HEYIZHEN_ZHENZHONGDAJIANG])
            {
               this.fujia.visible = false;
               this.kuangSpr.visible = true;
               this.fts2.visible = true;
            }
            else
            {
               this.fujia.visible = true;
               this.kuangSpr.visible = false;
               this.fts2.visible = false;
            }
         }
         else if(GameState.dictTargetStatus[SpecialGoodsID.HEYIZHEN_ZHENZHONGDAJIANG])
         {
            this.fujia.visible = false;
            this.kuangSpr.visible = true;
            this.fts2.visible = true;
         }
         else
         {
            this.fujia.visible = true;
            this.kuangSpr.visible = false;
            this.fts2.visible = false;
         }
      }
      
      public function setHeYiZhenBaoFa(param1:Boolean, param2:int) : void
      {
         this.baoFaCiShu = param2;
         if(param1)
         {
            this.baofafts1.visible = GameState.dictMainStatus[SpecialGoodsID.HEYIZHEN_BAOFASHI_ID];
            this.baofaBtn.visible = GameState.dictMainStatus[SpecialGoodsID.HEYIZHEN_BAOFASHI_ID];
            if(this.baoFaCiShu >= 100)
            {
               this.baofaBtn.enabled = false;
            }
            else
            {
               this.baofaBtn.enabled = true;
            }
         }
         else
         {
            this.baofafts1.visible = GameState.dictTargetStatus[SpecialGoodsID.HEYIZHEN_BAOFASHI_ID];
            this.baofaBtn.visible = GameState.dictTargetStatus[SpecialGoodsID.HEYIZHEN_BAOFASHI_ID];
            this.baofaBtn.enabled = false;
         }
      }
      
      public function setxunzhang(param1:String) : void
      {
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this.item = new ItemFace(new Goods(parseInt(_loc2_[_loc3_])));
            this.item.x = 45 * _loc3_ + 17;
            this.item.y = 0;
            this.jinengSpr.addChild(this.item);
            _loc3_++;
         }
      }
      
      public function setcishu(param1:int) : void
      {
         if(param1 == 0)
         {
            this.buzhenBtn.enabled = false;
         }
         else
         {
            this.buzhenBtn.enabled = true;
         }
         this.buzhenBtn.label = LanResManager.getLanCommonTextWords("布阵") + "（" + param1 + "）";
      }
      
      public function setBuZhen(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         var _loc5_:BaseItem = null;
         var _loc7_:int = 0;
         while(this.buzhenSpr.numChildren > 0)
         {
            _loc2_ = this.buzhenSpr.getChildAt(0) as ItemFace;
            this.buzhenSpr.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc4_:int = int(param1.length);
         var _loc6_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1[_loc3_];
            _loc7_ = _loc5_.position;
            _loc2_ = new ItemFace(_loc5_,65,65);
            _loc2_.showRedMask();
            _loc2_.setShowCount(false);
            switch(_loc7_)
            {
               case 1:
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  break;
               case 2:
                  _loc2_.x = 73;
                  _loc2_.y = 0;
                  break;
               case 3:
                  _loc2_.x = 73 * 2;
                  _loc2_.y = 0;
                  break;
               case 4:
                  _loc2_.x = 0;
                  _loc2_.y = 73;
                  break;
               case 5:
                  _loc2_.x = 73;
                  _loc2_.y = 73;
                  break;
               case 6:
                  _loc2_.x = 73 * 2;
                  _loc2_.y = 73;
                  break;
               case 7:
                  _loc2_.x = 0;
                  _loc2_.y = 73 * 2 + 1;
                  break;
               case 8:
                  _loc2_.x = 73;
                  _loc2_.y = 73 * 2 + 1;
                  break;
               case 9:
                  _loc2_.x = 73 * 2;
                  _loc2_.y = 73 * 2 + 1;
            }
            this.buzhenSpr.addChild(_loc2_);
            _loc6_.push(_loc2_);
            _loc3_++;
         }
      }
      
      public function setPingBi(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setShuxingJiacheng(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Number, param10:int) : void
      {
         this.xunzhang.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param1 + "</font>";
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + param2 + "</font>";
         this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "" + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "" + param5 + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + "" + param7 + "</font>";
         this.youshuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御：") + "" + param4 + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + "" + param8 + "</font>";
         this.zuoXiShu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>*" + param9.toFixed(1) + "<br>*" + param9.toFixed(1) + "<br>*" + param9.toFixed(1) + "</font>";
         this.youXiShu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>*" + param9.toFixed(1) + "<br>*" + param9.toFixed(1) + "</font>";
         this.zuoMAX.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>(" + param10 + ")<br>(" + param10 + ")<br>(" + param10 + ")</font>";
         this.youMAX.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>(" + param10 + ")<br>(" + param10 + ")<br></font>";
      }
      
      public function setZhenFaTiSheng(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("功法提升");
            this.lingWuBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2 >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingWuBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
               this.lingWuBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
               this.lingWuBtn.enabled = false;
            }
         }
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.heyizhenTupo.x == 138)
            {
               TweenMax.to(this.heyizhenTupo,1,{"x":410});
               this.tupoBo = true;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this.lingWuBtn.enabled = false;
            }
         }
         else
         {
            if(this.heyizhenTupo.x == 410)
            {
               TweenMax.to(this.heyizhenTupo,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_HEYIZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this.lingWuBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.heyizhenTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this.heyizhenTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.heyizhenTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.heyizhenTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.heyizhenTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.lingWuBtn.enabled = false;
         this.buzhenBtn.enabled = false;
         this.check.enabled = false;
         this.buzhenBtn.visible = false;
      }
      
      public function setXianShi(param1:Boolean) : void
      {
         this.bg0.visible = !param1;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("鹤翼阵顶级属性(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("鹤翼阵顶级属性(未激活)");
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_HeYiZhen(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN2)
            {
               _loc4_.x = 40 + 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN3)
            {
               _loc4_.x = 40 + 4 + 1 + 40;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN4)
            {
               _loc4_.x = 40 + 4 + 1 + 80;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

