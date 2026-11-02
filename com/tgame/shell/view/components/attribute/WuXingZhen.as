package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class WuXingZhen extends Sprite
   {
      
      public static const UI_TUPO_GUANBI_CLICK:String = "UI_TUPO_GUANBI_CLICK";
      
      public var maxGrade:int = 10;
      
      public var minGrade:int = 1;
      
      public var _parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var curSelect:int;
      
      private var curGrade:int;
      
      private var dataArray:Array;
      
      private var isOther:Boolean;
      
      private var yanhuaMc:MovieClip;
      
      public var btnArray:Array;
      
      private var selecNname:FTextArea;
      
      private var lv:FTextArea;
      
      private var preBtn:FSimpleButton;
      
      private var nextBtn:FSimpleButton;
      
      private var attribute:FTextArea;
      
      private var nameBg:F9GridBitmap;
      
      private var lvBg:F9GridBitmap;
      
      private var shuoMingBtn:SecondButton;
      
      private var shuoMingCanvas:FCanvas;
      
      private var selectMc:MovieClip;
      
      private var selectSpr:Sprite;
      
      private var tupoBtn:SecondButton;
      
      private var bgMc:MovieClip;
      
      private var btn0:MovieClip;
      
      private var btn1:MovieClip;
      
      private var btn2:MovieClip;
      
      private var btn3:MovieClip;
      
      private var btn4:MovieClip;
      
      private var url0:String;
      
      private var url1:String;
      
      private var url2:String;
      
      private var url3:String;
      
      private var url4:String;
      
      private var spr0:Sprite;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var barBar1:ColorBar;
      
      private var barBar2:ColorBar;
      
      private var barBar3:ColorBar;
      
      private var barBar4:ColorBar;
      
      private var barBar5:ColorBar;
      
      private var barBg1:Bitmap;
      
      private var barBg2:Bitmap;
      
      private var barBg3:Bitmap;
      
      private var barBg4:Bitmap;
      
      private var barBg5:Bitmap;
      
      private var jiaCheng1:FTextArea;
      
      private var jiaCheng2:FTextArea;
      
      private var zhongJiaCheng:FTextArea;
      
      private var tupoCanvas:WuXingZhenTuPoCanvas;
      
      private var bgArr:Array;
      
      public var bg:Bitmap;
      
      private var equipContainer:Sprite;
      
      private var lockImg:Bitmap;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var fts2Bo:Boolean = false;
      
      private var guanghuan:DisplayObject;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      private var fts5:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var fts8:FTextArea;
      
      private var checkHz:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts10:FTextArea;
      
      private var checkDt1:FCheckBox;
      
      private var fts11:FTextArea;
      
      private var checkHz2:FCheckBox;
      
      private var fts12:FTextArea;
      
      public function WuXingZhen()
      {
         var bgdown:DisplayObject;
         var i:int;
         var fa:FTextArea;
         var ft:FTextArea;
         var selectBmp:DisplayObject;
         var $mask:Sprite;
         var url:String = null;
         var urlselect:String = null;
         var bg:DisplayObject = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         bgdown = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/bgdown.swf");
         bgdown.x = 2;
         bgdown.y = 253 + 2;
         addChild(bgdown);
         this.bgArr = new Array();
         i = 0;
         while(i < 5)
         {
            bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/" + i + ".swf");
            bg.x = 2;
            bg.y = 4;
            addChild(bg);
            if(i != 0)
            {
               bg.visible = false;
            }
            this.bgArr.push(bg);
            i++;
         }
         this.guanghuan = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/guang.swf");
         this.guanghuan.x = 2 + 83;
         this.guanghuan.y = 2 + 13;
         addChild(this.guanghuan);
         this.nameBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.nameBg);
         this.nameBg.width = 56;
         this.nameBg.x = 5;
         this.nameBg.y = 280 - 5 - 20 + 5;
         this.selecNname = new FTextArea();
         this.selecNname.defaultTextFormat = StaticValue.format;
         this.selecNname.textColor = StaticValue.WHITE;
         this.selecNname.filters = StaticValue.filter;
         this.selecNname.width = 56;
         this.selecNname.height = 20;
         this.selecNname.x = 5;
         this.selecNname.y = 281 - 5 - 20 + 5;
         addChild(this.selecNname);
         this.lvBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.lvBg);
         this.lvBg.width = 69;
         this.lvBg.x = 85;
         this.lvBg.y = 280 - 5 - 20 + 5;
         this.lv = new FTextArea();
         this.lv.defaultTextFormat = StaticValue.format;
         this.lv.textColor = StaticValue.WHITE;
         this.lv.filters = StaticValue.filter;
         this.lv.width = 69;
         this.lv.height = 20;
         this.lv.x = 85;
         this.lv.y = 281 - 5 - 20 + 5;
         addChild(this.lv);
         this.preBtn = new FSimpleButton();
         this.preBtn.skin = "previousButton";
         addChild(this.preBtn);
         this.preBtn.x = 65;
         this.preBtn.y = 280 - 5 - 20 + 5;
         this.preBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextBtn = new FSimpleButton();
         this.nextBtn.skin = "nextButton";
         addChild(this.nextBtn);
         this.nextBtn.x = 157 - 2;
         this.nextBtn.y = 280 - 5 - 20 + 5;
         this.nextBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.attribute = new FTextArea();
         this.attribute.autoSize = TextFieldAutoSize.LEFT;
         this.attribute.textColor = StaticValue.YELLOW;
         this.attribute.filters = StaticValue.filter;
         this.attribute.x = 15;
         this.attribute.y = 300 - 7 - 20 + 10;
         this.attribute.htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("生命") + "<br>" + LanResManager.getLanCommonTextWords("内力") + "<br>" + LanResManager.getLanCommonTextWords("体力") + "<br>" + LanResManager.getLanCommonTextWords("攻击") + "<br>" + LanResManager.getLanCommonTextWords("防御") + "</textformat>";
         addChild(this.attribute);
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 - 20 + 12 + 1;
         this.barBar1 = new ColorBar(5,123,5);
         addChild(this.barBar1);
         this.barBar1.setValue(10000,100000);
         this.barBar1.x = this.barBg1.x + 4;
         this.barBar1.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 30 - 20;
         this.barBar2 = new ColorBar(5,123,5);
         addChild(this.barBar2);
         this.barBar2.setValue(10000,100000);
         this.barBar2.x = this.barBg1.x + 4;
         this.barBar2.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 40 - 20 + 10 - 5;
         this.barBar3 = new ColorBar(5,123,5);
         addChild(this.barBar3);
         this.barBar3.setValue(10000,100000);
         this.barBar3.x = this.barBg1.x + 4;
         this.barBar3.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 60 - 20;
         this.barBar4 = new ColorBar(5,123,5);
         addChild(this.barBar4);
         this.barBar4.setValue(10000,100000);
         this.barBar4.x = this.barBg1.x + 4;
         this.barBar4.y = this.barBg1.y + 3;
         this.barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.barBg1);
         this.barBg1.x = 30 + 15;
         this.barBg1.y = 300 - 7 + 80 - 20 - 3;
         this.barBar5 = new ColorBar(5,123,5);
         addChild(this.barBar5);
         this.barBar5.setValue(10000,100000);
         this.barBar5.x = this.barBg1.x + 4;
         this.barBar5.y = this.barBg1.y + 3;
         fa = new FTextArea();
         fa.defaultTextFormat = StaticValue.format;
         fa.textColor = StaticValue.ORANGE;
         fa.filters = StaticValue.filter;
         fa.x = 255 - 15 + 25;
         fa.y = 275 - 20 + 10;
         addChild(fa);
         fa.text = LanResManager.getLanCommonTextWords("总的属性加成");
         this.zhongJiaCheng = new FTextArea();
         this.zhongJiaCheng.filters = StaticValue.filter;
         this.zhongJiaCheng.x = 185 + 50 + 30;
         this.zhongJiaCheng.y = 295 - 20 + 10;
         this.zhongJiaCheng.autoSize = TextFieldAutoSize.LEFT;
         addChild(this.zhongJiaCheng);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 165;
         this.shuoMingCanvas.height = 250;
         ft = new FTextArea();
         ft.width = 193;
         ft.height = 20;
         ft.x = -20;
         ft.y = 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("五行阵说明") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25;
         ft.textColor = StaticValue.GREEN;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("使用五行元素可提升五行阵对应阵法的属性，该属性直接作用于角色自身。") + "<br><br>" + "</textformat>";
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25 + 120 - 50;
         ft.textColor = StaticValue.BLUE;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("当阵法属性各项数值均达到满值之后，可使用突破功能进入阵法的下一层境界，从而能够继续提升属性。") + "<br><br>" + "</textformat>";
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 8;
         ft.y = 25 + 240 - 80;
         ft.textColor = StaticValue.RED;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("阵法属性达到满值之后未突破时将不能使用五行元素提升属性！") + "<br>" + "</textformat>";
         this.shuoMingBtn = new SecondButton();
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("阵法说明");
         addChild(this.shuoMingBtn);
         this.shuoMingBtn.x = 325 - 5;
         this.shuoMingBtn.y = 245 - 20;
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bgMc = new MovieClip();
         url = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/bgmc.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url)
            {
               return;
            }
            if(Boolean(bgMc) && bgMc.parent != null)
            {
               bgMc.stop();
               bgMc.parent.removeChild(bgMc);
            }
            bgMc = _loc2_.content as MovieClip;
            if(bgMc)
            {
               addChildAt(bgMc,6);
               bgMc.mouseEnabled = false;
               bgMc.mouseChildren = false;
               bgMc.x = 70;
               bgMc.y = 0;
            }
         },null,false,url);
         this.btnArray = new Array();
         this.initBtns();
         this.selectSpr = new Sprite();
         this.selectSpr.mouseChildren = false;
         this.selectSpr.mouseEnabled = false;
         this.selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/select.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            selectMc = _loc2_.content as MovieClip;
            if(selectMc)
            {
               selectMc.x = -3;
               selectSpr.addChildAt(selectMc,0);
            }
         },null,false,urlselect);
         selectBmp = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/selectimg.swf");
         selectBmp.x = 5;
         selectBmp.y = 5 + 2;
         this.selectSpr.addChild(selectBmp);
         this.selectSpr.x = 165 + 2 - 5 - 2;
         this.selectSpr.y = 75 - 80;
         addChild(this.selectSpr);
         this.tupoBtn = new SecondButton();
         this.tupoBtn.label = LanResManager.getLanCommonTextWords("已达顶层");
         addChild(this.tupoBtn);
         this.tupoBtn.x = 180;
         this.tupoBtn.y = 258;
         this.tupoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tupoCanvas = new WuXingZhenTuPoCanvas();
         addChild(this.tupoCanvas);
         this.tupoCanvas.x = -10;
         this.tupoCanvas.y = 385;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 245;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,130);
            endFill();
         }
         this.tupoCanvas.mask = $mask;
         addEventListener(UI_TUPO_GUANBI_CLICK,this.onTupoClose);
         this.equipContainer = new Sprite();
         this.equipContainer.x = 178;
         this.equipContainer.y = 108;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         addChild(this.equipContainer);
         this.fts = new FTextArea();
         this.fts.x = 300 - 40;
         this.fts.y = 15;
         this.fts.textColor = StaticValue.GREEN;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("五行终极阵谱（已激活）");
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击2288888、防御1888888、血量10888888 、暴击20% 、闪避30%") + "<br>" + LanResManager.getLanCommonTextWords("五行顶级效果：五行阵达到顶级，玩家在每次攻击时，都将造成任何一位对手50%的重度伤害。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 230;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("五行乾坤秘籍（已激活）");
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击8888888 防御 6888888 血量18888888 暴击 888 闪避888  所有武功提升6层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 10;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 140;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("五行剑阵秘籍（已激活）");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("五行剑阵秘籍：") + "<br>" + LanResManager.getLanCommonTextWords("双击使用激活五行阵的五大阵眼属性，可对没有激活五行衍神剑阵的玩家造成永久五倍伤害，") + "<br>" + LanResManager.getLanCommonTextWords("且每攻击二十次都有50%的几率造成定身3秒！") + "<br></font>";
            if(fts2Bo)
            {
               _loc1_ += LanResManager.getLanCommonTextWords("五行衍神剑阵：") + "<br>" + LanResManager.getLanCommonTextWords("攻击：4888亿、防御3888亿、血量8888亿、所有武功提升 80000层") + "<br>" + LanResManager.getLanCommonTextWords("衍神剑阵(特殊技能)：激活五行剑阵秘籍的玩家双击使用后，拥有100%克制五行剑阵秘籍的效果。") + "<br>" + LanResManager.getLanCommonTextWords("且升级五行剑阵效果，每攻击十次都有50%的几率造成定身3秒。攻击同时有几率触发衍神剑阵特殊效果，") + "<br>" + LanResManager.getLanCommonTextWords("束缚对手无法移动，效果持续10秒！");
            }
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 300 - 40 - 13;
         this.fts3.y = 15 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 140 + 10;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("五行天煞阵秘籍（已激活）");
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("五行天煞阵秘籍：攻击8888888888900 防御5888888888900 血量9888888888900暴击 88888闪避88888   所有武功1500000层") + "<br>" + LanResManager.getLanCommonTextWords("★  五行天煞阵 ——  每攻击20次将100%使对手命中五行天煞阵，对手在此状态下，每增加一个负面状态，都将损失") + "<br>" + LanResManager.getLanCommonTextWords("10%的当前血量，且累计获得5个负面状态时，都将造成对手内力和体力全失。冷却时间30秒") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 300 - 40 - 13;
         this.fts4.y = 15 + 20 + 20;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 140 + 10;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("明教五行旗（已激活）");
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玩家同时佩戴明教五行旗时，攻击或被攻击时有几率触发五行大阵效果，在此状态") + "<br>" + LanResManager.getLanCommonTextWords("下，将以自身为中心，范围5格内所有自身帮会成员或是组队成员都将无敌。") + "<br></font>";
            return _loc1_ + "</textformat>";
         });
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 0;
         this.equipContainers.y = 0;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 120 + 20;
         this.kuangHD.y = 48 + 20;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 120 + 87 + 12;
         this.kuangHD.y = 48 + 20;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 120;
         this.kuangHD.y = 48 + 85;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 120 + 87 + 32;
         this.kuangHD.y = 48 + 85;
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 120 + 60 - 1;
         this.kuangHD.y = 48 + 100 + 27;
         this.fts5 = new FTextArea();
         this.fts5.x = 300 - 40 - 13 + 15;
         this.fts5.y = 15 + 20 + 20 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 110;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("蜀山") + "•" + LanResManager.getLanCommonTextWords("魔剑仙秘籍");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("魔灵守护：拥有魔界煞气的剑仙，自魔界诞生就有魔灵一直守护该剑仙，人物可自己切换魔灵。") + "<br>" + LanResManager.getLanCommonTextWords("魔剑仙：攻击时100%触发魔剑仙，持续10秒；在此状态下，自身将御剑成魔，对手所攻击都将") + "<br>" + LanResManager.getLanCommonTextWords("对其无效，且自身每攻击一次，对手的能力将被魔剑封印，10秒内无法锁定任人，使对手欲动") + "<br>" + LanResManager.getLanCommonTextWords("不能；状态解除后，魔气退出，全身净化瞬间无敌，持续10秒。冷却6秒") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 300 - 40 - 13 + 115 + 15;
         this.checkZq.y = 15 + 20 + 20 + 20;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts6 = new FTextArea();
         this.fts6.x = 300 - 40 - 13 + 15 + 55;
         this.fts6.y = 15 + 20 + 20 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 110;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("诛仙神器秘籍");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击10888888888888防御8288888888888血量10088888888888暴击108888闪避108888  所有武功6000000层") + "<br>" + LanResManager.getLanCommonTextWords("激活后，额外增加人物 1000% 全属性。特殊技能特效：攻击时100%麻痹对手5秒，技能冷却45秒！") + "<br>" + LanResManager.getLanCommonTextWords("诛仙剑阵：佩戴该神器的玩家，将100%抵抗下坐骑状态，让自身永不落马，驰骋沙场！");
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 300 - 40 - 13 + 15 - 250;
         this.fts7.y = 15 + 20 + 20 + 20 + 20 + 20 + 57;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 110;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("芭蕉铁扇（神器）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("芭蕉铁扇：至阴之物，芭蕉铁扇本是昆仑山后自混沌开辟以来，天地产成的一个灵宝，") + "<br>" + LanResManager.getLanCommonTextWords("乃太阴之精叶，故能灭火气，扇出的阴风能使人飘八万四千里方能止住。") + "<br>" + LanResManager.getLanCommonTextWords("铁扇阴风：攻击时有几率铁扇阴风，持续10秒；在此状态下，自身将受到昆仑山的庇护，") + "<br>" + LanResManager.getLanCommonTextWords("对手将无法锁定到自身；且每攻击对手一次，都可瞬间将手飘至十丈之外，且受到阴风") + "<br>" + LanResManager.getLanCommonTextWords("的影响当对手飘停止时可瞬间眩晕原地5秒；且当对手状态解除后将受到阴风之力影响") + "<br>" + LanResManager.getLanCommonTextWords("头晕脑花。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 300 - 40 - 13 + 115 - 250;
         this.checkWq.y = 15 + 20 + 20 + 20 + 20 + 20 + 57;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts8 = new FTextArea();
         this.fts8.x = 300 - 40 - 13 + 15 + 15;
         this.fts8.y = 15 + 20 + 20 + 20 + 20 + 20 + 25;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 110;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("铁扇公主（神）");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("铁扇公主，又叫罗刹女，得道的仙人，长得漂亮俊俏，与牛魔王是结拜夫妻，生有一子红孩儿，") + "<br>" + LanResManager.getLanCommonTextWords("住在翠云山芭蕉洞，人物可自己变装铁扇公主。") + "<br>" + LanResManager.getLanCommonTextWords("铁扇内丹：攻击时有几率触发铁扇内丹，持续20秒；在此状态下，每经过三秒自身将触发一次") + "<br>" + LanResManager.getLanCommonTextWords("内丹之威，使自身瞬间无敌3秒；且自身每移动一秒，可瞬间使5格范围内的所有玩家定身原地") + "<br>" + LanResManager.getLanCommonTextWords("无法移动，持续10秒，当状态解除后，内丹回收，附近5格内的所有对手将被震眩3秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkHz = new FCheckBox();
         addChild(this.checkHz);
         this.checkHz.x = 300 - 40 - 13 + 115;
         this.checkHz.y = 15 + 20 + 20 + 20 + 20 + 20 + 25;
         this.checkHz.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 300 - 40 - 13 + 15 + 15;
         this.fts9.y = 15 + 20 + 20 + 20 + 20 + 20 + 25 + 25;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 110;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("魔王守护（魔）");
         this.fts9.visible = false;
         addChild(this.fts9);
         ToolTips.createToolTips(this.fts9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("守护：拥有坚硬的护盾，可抵抗一切攻击，人物可自己召唤该魔王。") + "<br>" + LanResManager.getLanCommonTextWords("魔王守护：攻击时有几率触发魔王守护，持续10秒；在此状态下，每次受到对手的攻击时，") + "<br>" + LanResManager.getLanCommonTextWords("自身都将反弹自己所有勋章中的一个负面效果，持续10秒；且自身在护盾下，将免疫对手") + "<br>" + LanResManager.getLanCommonTextWords("的所有攻击伤害和所有技能效果；且当状态解除后，魔王将释施所有守护之力，使自身守") + "<br>" + LanResManager.getLanCommonTextWords("护达到无敌的状态，持续5秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 300 - 40 - 13 + 115;
         this.checkDt.y = 15 + 20 + 20 + 20 + 20 + 20 + 25 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts10 = new FTextArea();
         this.fts10.x = 300 - 40 - 13 + 15 + 15;
         this.fts10.y = 15 + 20 + 20 + 20 + 20 + 20 + 25 + 25 + 25;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 110;
         this.fts10.height = 20;
         this.fts10.htmlText = LanResManager.getLanCommonTextWords("死亡绣球");
         this.fts10.visible = false;
         addChild(this.fts10);
         this.checkDt1 = new FCheckBox();
         addChild(this.checkDt1);
         this.checkDt1.x = 300 - 40 - 13 + 115;
         this.checkDt1.y = 15 + 20 + 20 + 20 + 20 + 20 + 25 + 25 + 25;
         this.checkDt1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts11 = new FTextArea();
         this.fts11.x = 300 - 40 - 13 + 15 - 250;
         this.fts11.y = 15 + 20 + 20 + 20 + 20 + 20 + 57 + 25;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 110;
         this.fts11.height = 20;
         this.fts11.htmlText = LanResManager.getLanCommonTextWords("暗黑魔君");
         this.fts11.visible = false;
         addChild(this.fts11);
         this.checkHz2 = new FCheckBox();
         addChild(this.checkHz2);
         this.checkHz2.x = 80;
         this.checkHz2.y = 15 + 20 + 20 + 20 + 20 + 20 + 57 + 25;
         this.checkHz2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts12 = new FTextArea();
         this.fts12.x = 300 - 40 - 13 + 15 - 250;
         this.fts12.y = 15 + 20 + 20 + 20 + 20 + 20 + 57 + 25 + 20;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.width = 110;
         this.fts12.height = 20;
         this.fts12.htmlText = LanResManager.getLanCommonTextWords("暗黑骑士（称号）");
         this.fts12.visible = false;
         addChild(this.fts12);
         ToolTips.createToolTips(this.fts12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("拥有暗黑骑士称号的玩家，可激活暗黑骑士技能:攻击时有几率触发暗黑骑士，") + "<br>" + LanResManager.getLanCommonTextWords("持续10秒；对手在此状态下，每次移动都将被骑士束缚回转瞬间被回拉至原地；") + "<br>" + LanResManager.getLanCommonTextWords("且每拉回一次对手都将受到恶奴的侵蚀，内力疼痛无法施发门派武学、江湖武") + "<br>" + LanResManager.getLanCommonTextWords("学、帮派武学、降龙十八掌技能。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,41]));
               break;
            case this.checkWq:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,82]));
               break;
            case this.checkHz:
               this.checkHz2.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz.selectState,83]));
               break;
            case this.checkHz2:
               this.checkHz.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkHz2.selectState,99]));
               break;
            case this.checkDt:
               this.checkDt1.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,84]));
               break;
            case this.checkDt1:
               this.checkDt.selectState = false;
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt1.selectState,90]));
         }
      }
      
      private function initBtns() : void
      {
         this.spr0 = new Sprite();
         this.btn0 = new MovieClip();
         this.spr0.name = "0";
         this.spr0.buttonMode = true;
         this.spr0.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr0);
         this.url0 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/huo.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url0)
            {
               return;
            }
            if(Boolean(btn0) && btn0.parent != null)
            {
               btn0.stop();
               btn0.parent.removeChild(btn0);
            }
            btn0 = _loc2_.content as MovieClip;
            if(btn0)
            {
               spr0.addChild(btn0);
            }
         },null,false,this.url0);
         this.spr0.x = 165 + 2 - 5 - 5;
         this.spr0.y = 75 - 80;
         this.btnArray.push(this.spr0);
         this.spr1 = new Sprite();
         this.btn1 = new MovieClip();
         this.spr1.name = "1";
         this.spr1.buttonMode = true;
         this.spr1.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr1);
         this.url1 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/jin.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url1)
            {
               return;
            }
            if(Boolean(btn1) && btn1.parent != null)
            {
               btn1.stop();
               btn1.parent.removeChild(btn1);
            }
            btn1 = _loc2_.content as MovieClip;
            if(btn1)
            {
               spr1.addChild(btn1);
            }
         },null,false,this.url1);
         this.spr1.x = 260 + 5 + 5 - 20 - 5;
         this.spr1.y = 160 - 80 - 5;
         this.btnArray.push(this.spr1);
         this.spr2 = new Sprite();
         this.btn2 = new MovieClip();
         this.spr2.name = "2";
         this.spr2.buttonMode = true;
         this.spr2.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr2);
         this.url2 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/mu.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url2)
            {
               return;
            }
            if(Boolean(btn2) && btn2.parent != null)
            {
               btn2.stop();
               btn2.parent.removeChild(btn2);
            }
            btn2 = _loc2_.content as MovieClip;
            if(btn2)
            {
               spr2.addChild(btn2);
            }
         },null,false,this.url2);
         this.spr2.x = 220 + 10 - 20 + 5;
         this.spr2.y = 260 + 5 - 80 - 20 - 5;
         this.btnArray.push(this.spr2);
         this.spr3 = new Sprite();
         this.spr3.buttonMode = true;
         this.btn3 = new MovieClip();
         this.spr3.name = "3";
         this.spr3.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr3);
         this.url3 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/tu.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url3)
            {
               return;
            }
            if(Boolean(btn3) && btn3.parent != null)
            {
               btn3.stop();
               btn3.parent.removeChild(btn3);
            }
            btn3 = _loc2_.content as MovieClip;
            if(btn3)
            {
               spr3.addChild(btn3);
            }
         },null,false,this.url3);
         this.spr3.x = 90 + 5 + 10 + 10 - 5;
         this.spr3.y = 260 + 5 - 80 - 20 - 5;
         this.btnArray.push(this.spr3);
         this.spr4 = new Sprite();
         this.btn4 = new MovieClip();
         this.spr4.name = "4";
         this.spr4.buttonMode = true;
         this.spr4.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.spr4);
         this.url4 = GameConfig.fileBaseFolder + "res/ui/UIditu/wuxingzhen/shui.swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != url4)
            {
               return;
            }
            if(Boolean(btn4) && btn4.parent != null)
            {
               btn4.stop();
               btn4.parent.removeChild(btn4);
            }
            btn4 = _loc2_.content as MovieClip;
            if(btn4)
            {
               spr4.addChild(btn4);
            }
         },null,false,this.url4);
         this.spr4.x = 50 + 15 + 5;
         this.spr4.y = 160 - 80 - 5;
         this.btnArray.push(this.spr4);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.tupoCanvas.$parent = this._parent;
         this.tupoCanvas.$parent2 = this;
      }
      
      private function onTupoClose(param1:BaseEvent) : void
      {
         this.showTupoPanel(false);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         var _loc3_:int = parseInt(_loc2_.name);
         if(_loc3_ == this.curSelect)
         {
            return;
         }
         this.curSelect = _loc3_;
         this.curGrade = this.dataArray[_loc3_].grade;
         this.showTupoPanel(false);
         switch(param1.target)
         {
            case this.spr0:
               this.setSelectData(0);
               break;
            case this.spr1:
               this.setSelectData(1);
               break;
            case this.spr2:
               this.setSelectData(2);
               break;
            case this.spr3:
               this.setSelectData(3);
               break;
            case this.spr4:
               this.setSelectData(4);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shuoMingBtn:
               if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
               {
                  if(this.shuoMingCanvas.parent)
                  {
                     this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
                  }
               }
               else
               {
                  addChild(this.shuoMingCanvas);
                  this.shuoMingCanvas.x = 415;
                  this.shuoMingCanvas.y = 0;
               }
               break;
            case this.tupoBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_TUPO_CLICK,"",[this.curSelect,this.curGrade]));
               break;
            case this.preBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_PRE_NEXT_CLICK,"",[this.curSelect,this.curGrade - 1]));
               break;
            case this.nextBtn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_PRE_NEXT_CLICK,"",[this.curSelect,this.curGrade + 1]));
         }
      }
      
      private function resizeTeXiao(param1:int) : void
      {
         this.selectSpr.x = this.btnArray[param1].x + 3;
         this.selectSpr.y = this.btnArray[param1].y + 1;
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function setPreNextBtn(param1:int) : void
      {
         if(param1 == this.minGrade)
         {
            this.preBtn.enabled = false;
            this.nextBtn.enabled = true;
         }
         if(param1 == this.maxGrade)
         {
            this.preBtn.enabled = true;
            this.nextBtn.enabled = false;
         }
         if(param1 > this.minGrade && param1 < this.maxGrade)
         {
            this.preBtn.enabled = true;
            this.nextBtn.enabled = true;
         }
      }
      
      public function setPanel(param1:Boolean, param2:int, param3:Array, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Boolean, param10:Boolean, param11:Boolean, param12:Boolean) : void
      {
         this.isMain = param11;
         this.isOther = param1;
         this.dataArray = new Array();
         this.dataArray = param3;
         this.setSelectData(param2);
         this.setZhongJiaCheng(param4,param5,param6,param7,param8,param9);
         this.setZhongJi(param10);
         this.setJiHuo46(param11);
         this.checkZq.selectState = param12;
      }
      
      public function setGouXuan(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         this.checkWq.selectState = param1;
         this.checkHz.selectState = param2;
         this.checkDt.selectState = param3;
         this.checkDt1.selectState = param4;
         this.checkHz2.selectState = param5;
      }
      
      public function setJiHuo46(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_JIANZHEN_ID];
            this.fts2Bo = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_CHAOJIANZHEN_ID];
            this.guanghuan.visible = this.fts2Bo;
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_WUXINGTIANSHA_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_MINGJIAOWUXINGQI_ID])
            {
               this.fts4.visible = true;
               this.kuangSpr.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.kuangSpr.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_MOJIANXIAN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_ZHUXIANSHENQI_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_TIESHANGONGZHU_ID];
            this.checkHz.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_TIESHANGONGZHU_ID];
            this.fts9.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_MOWANGSHOUHU_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_MOWANGSHOUHU_ID];
            this.fts10.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_SIWANGXIUQIU_ID];
            this.checkDt1.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_SIWANGXIUQIU_ID];
            this.fts11.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_HEIANMOJUN_ID];
            this.checkHz2.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_HEIANMOJUN_ID];
            this.fts12.visible = GameState.dictMainStatus[SpecialGoodsID.WUXINGZHEN_HEIANQISHI_ID];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_JIANZHEN_ID];
            this.fts2Bo = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_CHAOJIANZHEN_ID];
            this.guanghuan.visible = this.fts2Bo;
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_WUXINGTIANSHA_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_MINGJIAOWUXINGQI_ID])
            {
               this.fts4.visible = true;
               this.kuangSpr.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.kuangSpr.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_MOJIANXIAN_ID])
            {
               this.fts5.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts5.visible = false;
               this.checkZq.visible = false;
            }
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_ZHUXIANSHENQI_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_TIESHANGONGZHU_ID];
            this.checkHz.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_TIESHANGONGZHU_ID];
            this.fts9.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_MOWANGSHOUHU_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_MOWANGSHOUHU_ID];
            this.fts10.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_SIWANGXIUQIU_ID];
            this.checkDt1.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_SIWANGXIUQIU_ID];
            this.fts11.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_HEIANMOJUN_ID];
            this.checkHz2.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_HEIANMOJUN_ID];
            this.fts12.visible = GameState.dictTargetStatus[SpecialGoodsID.WUXINGZHEN_HEIANQISHI_ID];
         }
      }
      
      public function setZhongJi(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("五行终极阵谱（已激活）");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("五行终极阵谱（未激活）");
         }
      }
      
      public function setSelectData(param1:int = 0) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 5)
         {
            if(_loc2_ == param1)
            {
               this.bgArr[_loc2_].visible = true;
            }
            else
            {
               this.bgArr[_loc2_].visible = false;
            }
            _loc2_++;
         }
         this.resizeTeXiao(param1);
         var _loc3_:Object = this.dataArray[param1] as Object;
         this.curSelect = param1;
         this.curGrade = _loc3_.grade;
         this.selecNname.htmlText = _loc3_.name;
         this.lv.htmlText = LanResManager.getLanCommonTextWords("等级：") + _loc3_.grade;
         this.barBar1.setValue(_loc3_.shengming,_loc3_.maxShengming);
         this.barBar2.setValue(_loc3_.neili,_loc3_.maxNeili);
         this.barBar3.setValue(_loc3_.tili,_loc3_.maxTili);
         this.barBar4.setValue(_loc3_.gongji,_loc3_.maxGongji);
         this.barBar5.setValue(_loc3_.fangyu,_loc3_.maxFangyu);
         this.setPreNextBtn(_loc3_.grade);
         this.setTuPoBtn(_loc3_.grade,_loc3_.status,_loc3_.shengming == _loc3_.maxShengming);
         if(this.isOther)
         {
            this.setEnableFun();
         }
      }
      
      public function setZhongJiaCheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : void
      {
         var _loc7_:String = "";
         _loc7_ = "<textformat leading=\'1\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>";
         if(param6)
         {
            if(param1 != 0)
            {
               _loc7_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + " " + "X" + " 2" + "<br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>";
            }
            if(param2 != 0)
            {
               _loc7_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + " " + "X" + " 2" + "<br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>";
            }
            if(param3 != 0)
            {
               _loc7_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + " " + "X" + " 2" + "<br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>";
            }
            if(param4 != 0)
            {
               _loc7_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + " " + "X" + " 2" + "<br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>";
            }
            if(param5 != 0)
            {
               _loc7_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + " " + "X" + " 2" + "<br>";
            }
            else
            {
               _loc7_ += LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>";
            }
         }
         else
         {
            _loc7_ += LanResManager.getLanCommonTextWords("生命：") + "+" + param1 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "+" + param2 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "+" + param3 + "<br>" + LanResManager.getLanCommonTextWords("攻击：") + "+" + param4 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "+" + param5 + "<br>" + "</font>";
         }
         _loc7_ += "</textformat>";
         this.zhongJiaCheng.htmlText = _loc7_;
      }
      
      public function setTuPoBtn(param1:int, param2:int, param3:Boolean) : void
      {
         if(param1 < param2)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已突破");
         }
         else
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("突破");
         }
         if(param1 == param2 && param1 == this.maxGrade)
         {
            this.tupoBtn.label = LanResManager.getLanCommonTextWords("已达顶层");
         }
         if(param3 && param1 == param2 && param1 != this.maxGrade)
         {
            this.tupoBtn.enabled = true;
         }
         else
         {
            this.tupoBtn.enabled = false;
         }
      }
      
      public function showShuoMing(param1:Boolean) : void
      {
         if(!param1)
         {
            if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
            {
               this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
            }
         }
      }
      
      public function showTupoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.tupoCanvas.y == 385)
            {
               TweenMax.to(this.tupoCanvas,1,{
                  "y":245,
                  "onComplete":this.onCom
               });
            }
         }
         else if(this.tupoCanvas.y == 245)
         {
            TweenMax.to(this.tupoCanvas,1,{
               "y":385,
               "onComplete":this.onCom
            });
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK,"",false));
         }
      }
      
      private function onCom() : void
      {
      }
      
      public function setTupoPanel(param1:int, param2:Goods, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         this.tupoCanvas.setTupoPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setTuPoPanelBtn(param1:Boolean) : void
      {
         this.tupoCanvas.setZdtsBtnLabel(param1);
      }
      
      public function isShowTupo() : Boolean
      {
         if(Boolean(this.tupoCanvas) && Boolean(this.tupoCanvas.parent != null) && this.tupoCanvas.y == 245)
         {
            return true;
         }
         return false;
      }
      
      public function setEnableFun() : void
      {
         this.tupoBtn.enabled = false;
         this.preBtn.enabled = false;
         this.nextBtn.enabled = false;
         this.shuoMingBtn.enabled = false;
      }
      
      public function set_ZhuXunzhang(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHENZHUXUNZHANG)
            {
               this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
               this.equipContainer.addChild(this.lockImg);
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 3;
               _loc4_.y = 3;
               this.equipContainer.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("五行乾坤秘籍(已激活)");
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("五行乾坤秘籍(未激活)");
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_WuXingZhenXunZhang(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI1)
            {
               _loc4_.x = 120 + 2 + 20;
               _loc4_.y = 48 + 2 + 20;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI2)
            {
               _loc4_.x = 120 + 2 + 99;
               _loc4_.y = 48 + 2 + 20;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI3)
            {
               _loc4_.x = 120 + 2;
               _loc4_.y = 50 + 85;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI4)
            {
               _loc4_.x = 120 + 2 + 119;
               _loc4_.y = 50 + 85;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI5)
            {
               _loc4_.x = 120 + 2 + 59;
               _loc4_.y = 50 + 127;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_WUXINGZHEN_BAJIAOSHAN)
            {
               _loc4_.x = 120 + 2 + 59 + 40 - 205;
               _loc4_.y = 50 + 127 + 40 - 85;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq.visible = true;
                  this.fts7.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts7.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

