package com.tgame.shell.view.components.siLingZhen
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   import gs.TweenMax;
   
   public class SiLingZhenCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var shuoMingBtn:SecondButton;
      
      private var jiHuoBtn:SecondButton;
      
      private var tiShengBtn:SecondButton;
      
      private var baihuTitle:FTextArea;
      
      private var xuanwuTitle:FTextArea;
      
      private var zhuqueTitle:FTextArea;
      
      private var qinglongTitle:FTextArea;
      
      private var baihuBtn:MovieClip;
      
      private var baihuBtnKey:String;
      
      private var xuanwuBtn:MovieClip;
      
      private var xuanwuBtnKey:String;
      
      private var zhuqueBtn:MovieClip;
      
      private var zhuqueBtnKey:String;
      
      private var qinglongBtn:MovieClip;
      
      private var qinglongBtnKey:String;
      
      private var baihuAvatar:MovieClip;
      
      private var baihuAvatarKey:String;
      
      private var xuanwuAvatar:MovieClip;
      
      private var xuanwuAvatarKey:String;
      
      private var zhuqueAvatar:MovieClip;
      
      private var zhuqueAvatarKey:String;
      
      private var qinglongAvatar:MovieClip;
      
      private var qinglongAvatarKey:String;
      
      private var buffAvatar:MovieClip;
      
      private var buffAvatarKey:String;
      
      private var name1:FTextArea;
      
      private var lv1:FTextArea;
      
      private var preBtn1:FSimpleButton;
      
      private var nextBtn1:FSimpleButton;
      
      private var attribute1:FTextArea;
      
      private var nameBg1:F9GridBitmap;
      
      private var lvBg1:F9GridBitmap;
      
      private var upgradePanel:SiLingZhenUpgradePanel;
      
      private var upgradePanelMask:Sprite;
      
      private var avatarContainer:Sprite;
      
      private var btn1:Sprite;
      
      private var btn2:Sprite;
      
      private var btn3:Sprite;
      
      private var btn4:Sprite;
      
      private var menghuanFta:FTextArea;
      
      private var mengHuanTips:String;
      
      private var shuoMingCanvas:FCanvas;
      
      private var curSelect:int;
      
      private var yanhuaMc:MovieClip;
      
      private var panelMask:Sprite;
      
      private var zongJiaCheng1:FTextArea;
      
      private var zongJiaCheng2:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var dataArr:Array;
      
      private var obj1:Object;
      
      private var obj2:Object;
      
      private var obj3:Object;
      
      private var obj4:Object;
      
      private var showLvArray:Array;
      
      private var showLv1:int;
      
      private var showLv2:int;
      
      private var showLv3:int;
      
      private var showLv4:int;
      
      public var isOthers:Boolean = false;
      
      private var isLockOn:Boolean = false;
      
      private var lockImg:Bitmap;
      
      private var equipContainer1:Sprite;
      
      private var equipContainer2:Sprite;
      
      private var zb1:Bitmap;
      
      private var zb2:Bitmap;
      
      private var fireStatus:int = 0;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var qinglongshi:int = 0;
      
      private var baihushi:int = 0;
      
      private var zhuqueshi:int = 0;
      
      private var xuanwushi:int = 0;
      
      private var fts3:FTextArea;
      
      private var check:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var sishou:int = 0;
      
      private var fts6:FTextArea;
      
      private var fengyinsuipian:int = 0;
      
      public function SiLingZhenCanvas()
      {
         var fa:FTextArea;
         var ft:FTextArea = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.width = 193;
         this.shuoMingCanvas.height = 370;
         ft = new FTextArea();
         ft.width = 250;
         ft.height = 20;
         ft.y = 5;
         ft.textColor = StaticValue.YELLOW;
         ft.filters = StaticValue.filter;
         ft.defaultTextFormat = StaticValue.format;
         ft.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("四灵阵") + "</font>";
         this.shuoMingCanvas.addChild(ft);
         ft = new FTextArea();
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.x = 2;
         ft.y = 25;
         ft.textColor = StaticValue.BLUE;
         ft.filters = StaticValue.filter;
         this.shuoMingCanvas.addChild(ft);
         ft.htmlText = "<textformat leading=\'0.5\'>" + LanResManager.getLanTextWords(this,"将四灵阵的阵眼激活可开启阵法",[StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.PURPLE_HTML]) + "</textformat>";
         this.bg = new Bitmap();
         this.bg.name = "ui.main.char.silingzhen.ui";
         addChild(this.bg);
         this.avatarContainer = new Sprite();
         addChild(this.avatarContainer);
         this.baihuTitle = new FTextArea();
         this.baihuTitle.defaultTextFormat = StaticValue.format;
         this.baihuTitle.textColor = StaticValue.WHITE;
         this.baihuTitle.filters = StaticValue.filter;
         this.baihuTitle.x = -8;
         this.baihuTitle.y = 35;
         addChild(this.baihuTitle);
         this.btn2 = new Sprite();
         addChild(this.btn2);
         this.btn2.x = 55;
         this.btn2.y = 10;
         this.btn2.buttonMode = true;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xuanwuTitle = new FTextArea();
         this.xuanwuTitle.defaultTextFormat = StaticValue.format;
         this.xuanwuTitle.textColor = StaticValue.WHITE;
         this.xuanwuTitle.filters = StaticValue.filter;
         this.xuanwuTitle.x = 305;
         this.xuanwuTitle.y = 35;
         addChild(this.xuanwuTitle);
         this.btn4 = new Sprite();
         addChild(this.btn4);
         this.btn4.x = 280;
         this.btn4.y = 10;
         this.btn4.buttonMode = true;
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zhuqueTitle = new FTextArea();
         this.zhuqueTitle.defaultTextFormat = StaticValue.format;
         this.zhuqueTitle.textColor = StaticValue.WHITE;
         this.zhuqueTitle.filters = StaticValue.filter;
         this.zhuqueTitle.x = -8;
         this.zhuqueTitle.y = 215;
         addChild(this.zhuqueTitle);
         this.btn3 = new Sprite();
         addChild(this.btn3);
         this.btn3.x = 55;
         this.btn3.y = 190;
         this.btn3.buttonMode = true;
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.qinglongTitle = new FTextArea();
         this.qinglongTitle.defaultTextFormat = StaticValue.format;
         this.qinglongTitle.textColor = StaticValue.WHITE;
         this.qinglongTitle.filters = StaticValue.filter;
         this.qinglongTitle.x = 305;
         this.qinglongTitle.y = 215;
         addChild(this.qinglongTitle);
         this.btn1 = new Sprite();
         addChild(this.btn1);
         this.btn1.x = 280;
         this.btn1.y = 190;
         this.btn1.buttonMode = true;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.menghuanFta = new FTextArea();
         this.menghuanFta.defaultTextFormat = StaticValue.format;
         this.menghuanFta.textColor = StaticValue.RED;
         this.menghuanFta.filters = StaticValue.filter;
         this.menghuanFta.x = 10;
         this.menghuanFta.y = 250;
         this.menghuanFta.visible = false;
         this.menghuanFta.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.menghuanFta.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         addChild(this.menghuanFta);
         this.menghuanFta.text = LanResManager.getLanCommonTextWords("已激活梦幻四灵阵");
         this.jiHuoBtn = new SecondButton();
         this.jiHuoBtn.label = LanResManager.getLanCommonTextWords("激活梦幻四灵阵");
         addChild(this.jiHuoBtn);
         this.jiHuoBtn.x = 5;
         this.jiHuoBtn.y = 245;
         this.jiHuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shuoMingBtn = new SecondButton();
         this.shuoMingBtn.label = LanResManager.getLanCommonTextWords("阵法说明");
         addChild(this.shuoMingBtn);
         this.shuoMingBtn.x = 325 + 3;
         this.shuoMingBtn.y = 245 + 20 + 6;
         this.shuoMingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nameBg1 = Tools.get9GridBitmpByName("countBg");
         addChild(this.nameBg1);
         this.nameBg1.width = 56;
         this.nameBg1.x = 5;
         this.nameBg1.y = 280 - 5;
         this.name1 = new FTextArea();
         this.name1.defaultTextFormat = StaticValue.format;
         this.name1.textColor = StaticValue.WHITE;
         this.name1.filters = StaticValue.filter;
         this.name1.width = 56;
         this.name1.height = 20;
         this.name1.x = 5;
         this.name1.y = 281 - 5;
         addChild(this.name1);
         this.lvBg1 = Tools.get9GridBitmpByName("countBg");
         addChild(this.lvBg1);
         this.lvBg1.width = 69;
         this.lvBg1.x = 85;
         this.lvBg1.y = 280 - 5;
         this.lv1 = new FTextArea();
         this.lv1.defaultTextFormat = StaticValue.format;
         this.lv1.textColor = StaticValue.WHITE;
         this.lv1.filters = StaticValue.filter;
         this.lv1.width = 69;
         this.lv1.height = 20;
         this.lv1.x = 85;
         this.lv1.y = 281 - 5;
         addChild(this.lv1);
         this.preBtn1 = new FSimpleButton();
         this.preBtn1.skin = "previousButton";
         addChild(this.preBtn1);
         this.preBtn1.x = 65;
         this.preBtn1.y = 280 - 5;
         this.preBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextBtn1 = new FSimpleButton();
         this.nextBtn1.skin = "nextButton";
         addChild(this.nextBtn1);
         this.nextBtn1.x = 157 - 2;
         this.nextBtn1.y = 280 - 5;
         this.nextBtn1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.attribute1 = new FTextArea();
         this.attribute1.autoSize = TextFieldAutoSize.LEFT;
         this.attribute1.textColor = StaticValue.YELLOW;
         this.attribute1.filters = StaticValue.filter;
         this.attribute1.x = 15;
         this.attribute1.y = 300 - 7;
         addChild(this.attribute1);
         this.tiShengBtn = new SecondButton();
         this.tiShengBtn.label = LanResManager.getLanCommonTextWords("可提升");
         addChild(this.tiShengBtn);
         this.tiShengBtn.x = 110 - 5 - 27;
         this.tiShengBtn.y = 300;
         this.tiShengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         fa = new FTextArea();
         fa.defaultTextFormat = StaticValue.format;
         fa.textColor = StaticValue.ORANGE;
         fa.filters = StaticValue.filter;
         fa.x = 255 - 15;
         fa.y = 275;
         addChild(fa);
         fa.text = LanResManager.getLanCommonTextWords("总的属性加成");
         this.zongJiaCheng1 = new FTextArea();
         this.zongJiaCheng1.filters = StaticValue.filter;
         this.zongJiaCheng1.x = 185;
         this.zongJiaCheng1.y = 295;
         addChild(this.zongJiaCheng1);
         this.zongJiaCheng1.htmlText = "";
         this.zongJiaCheng2 = new FTextArea();
         this.zongJiaCheng2.filters = StaticValue.filter;
         this.zongJiaCheng2.autoSize = TextFieldAutoSize.LEFT;
         this.zongJiaCheng2.x = 280;
         this.zongJiaCheng2.y = 295;
         addChild(this.zongJiaCheng2);
         this.zongJiaCheng2.htmlText = "";
         this.panelMask = new Sprite();
         this.panelMask.x = -90;
         this.panelMask.graphics.beginFill(0,1);
         this.panelMask.graphics.drawRect(0,0,900,370);
         this.panelMask.graphics.endFill();
         addChild(this.panelMask);
         this.mask = this.panelMask;
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.lockImg.x = 95 + 2;
         this.lockImg.y = 155 + 2;
         this.lockImg = StaticValue.getBitmapByClassName("ui.char.xunzhang.kuang");
         this.lockImg.x = 245 + 2;
         this.lockImg.y = 155 + 2;
         this.equipContainer1 = new Sprite();
         this.equipContainer1.x = 95;
         this.equipContainer1.y = 155;
         with(this.equipContainer1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainer2 = new Sprite();
         this.equipContainer2.x = 245;
         this.equipContainer2.y = 155;
         with(this.equipContainer2.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainer2.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer2);
         this.fts = new FTextArea();
         this.fts.x = 176;
         this.fts.y = 344;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.filters = StaticValue.filter;
         this.fts.htmlText = "四灵乾坤珠已激活";
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击2288888、防御1888888、血量488888888、暴击888、闪避888" + "<br>" + "蚩尤神力：受到伤害后，蚩尤神力将抵挡50%的伤害，并且蚩尤还将永久为人物加成30%的防御。" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 280;
         this.fts1.y = 5;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = "四灵阵神兽绝杀心法";
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击1688888888888 防御1288888888888 血量2088888888888暴击 88888闪避88888" + "<br>" + "四灵神兽绝杀特殊属性：青龙战纹5%、朱雀战纹4%、白虎战纹5% 所有武功250000层" + "<br>" + "四灵神兽绝杀 —— 攻击时有几率触发四灵神兽绝杀技能，触发后有10%的几率触发青龙之力直接秒杀对手，" + "<br>" + "有30%的几率触发白虎之力造成对手体力全失，有30%的几率触发朱雀之力使对手瞬间损失50%的总血量，有30%的几率触发玄武之力使对手定身5秒！" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.htmlText = "四灵血煞魂阵秘籍（已激活）";
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "提升属性：攻击10888888889000 防御8888888889000 血量12888888889000暴击 88888闪避88888   所有武功1800000层" + "<br>" + "★\t血煞魂阵 —— 攻击时有几率触发，将对手笼罩在血煞魂阵中，无论对手逃至何处，每5秒必定将对手瞬间拉回，降低其50%血量，并眩晕2秒。效果持续60秒！<br>" + "★\t四灵血煞魂阵特殊属性：激活该秘籍后，将开启四大阵眼的特殊属性，每个阵眼可灌注对应的圣兽血魄(朱雀血魄、白虎血魄、青龙血魄、玄武血魄)。<br>" + "每个阵眼都可灌注210个。每个增加：攻击200亿，所有武功20000层。" + "<br>" + "当前已灌注朱雀血魄" + zhuqueshi + "颗" + "<br>" + "攻击" + zhuqueshi * 200 + "亿，所有武功提升" + zhuqueshi * 20000 + "层" + "<br>" + "当前已灌注白虎血魄" + baihushi + "颗" + "<br>" + "攻击" + baihushi * 200 + "亿，所有武功提升" + baihushi * 20000 + "层" + "<br>" + "当前已灌注青龙血魄" + qinglongshi + "颗" + "<br>" + "攻击" + qinglongshi * 200 + "亿，所有武功提升" + qinglongshi * 20000 + "层" + "<br>" + "当前已灌注玄武血魄" + xuanwushi + "颗" + "<br>" + "攻击" + xuanwushi * 200 + "亿，所有武功提升" + xuanwushi * 20000 + "层" + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 256;
         this.fts3.y = 246;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 100;
         this.fts3.height = 20;
         this.fts3.htmlText = "幻魔暴龙兽进化石";
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "幻魔暴龙兽进化：开启坐骑进化功能后，点击勾选四灵阵坐骑进化功能，将永久使坐骑进化成幻魔暴" + "<br>" + "龙兽，进化将不会消失。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 256 + 117;
         this.check.y = 246;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 56;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 100 + 20;
         this.fts4.height = 20;
         this.fts4.htmlText = "撼天流金阵(已激活)";
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特珠属性：攻击：88888亿、防御60888亿、血量80888亿、所有武功提升 880000层" + "<br>" + "特殊效果：激活撼天流金阵的玩家，脚底下四灵阵将变化成黄金圣兽阵；且黄金圣兽阵下攻击" + "<br>" + "时100%触发撼天流金效果，持续10秒；自身在此状态下，每跳跃5次都将使5格内的所有玩" + "<br>" + "家都受将金光照射定身原地无法操作，且5格内的所有对手每被照射到一次，都将瞬间掉60%，" + "<br>" + "当状态解除后，对手双眼被金光照射，无法挣开，持续5秒。冷却60秒。 " + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10 + 267;
         this.fts5.y = 7 + 56;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 100 + 20;
         this.fts5.height = 20;
         this.fts5.htmlText = "万兽之王秘籍(已激活)";
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "万兽之王秘籍：攻击12888888889000 防御10888888889000 血量13888888889000 暴击 " + "<br>" + "88888   闪避88888   所有武功2500000层" + "<br>" + "兽王权威 ——攻击时100%触发兽王权威状态，持续30秒；在此状态下，范围5格内的所" + "<br>" + "有玩家或是攻击风雷兽的玩家，只要对手坐骑的阶数在风雷兽以下，都将100%下坐骑，且" + "<br>" + "5秒内无法骑乘，使对方坐骑消失在风雷兽视线内，冷却60秒。" + "<br>" + "可使用四兽碎片对该隐藏属性进行养成，最多可养成200次。每个增加：攻击1500亿，" + "<br>" + "所有武功350000层。 " + "<br>" + "当前已使用" + sishou + "个四兽碎片" + "<br>" + "增加攻击" + 1500 * sishou + "亿，所有武功" + 350000 * sishou + "层";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10 + 267;
         this.fts6.y = 7 + 56 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 100 + 20;
         this.fts6.height = 20;
         this.fts6.htmlText = "神兵锁链封印秘籍";
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "神兵封印秘籍：攻击12888888889000 防御10888888889000 血量13888888889000暴击 88888" + "<br>" + "闪避88888   所有武功2500000层" + "<br>" + "神兵封印 ——攻击时100%触发神兵锁链状态，持续20秒；对手在此状态下，所有神兵都将锁链" + "<br>" + "封印失效，无法使用，且被封印的期间，对手自身也将被锁链邪气反噬，每次移动都将瞬间掉血60%。" + "<br>" + "神兵封印属性：激活 神兵封印秘籍后，将开启 神兵封印隐藏属性，可使用锁链碎片对该隐藏属性进" + "<br>" + "行养成，最多可养成200次。每个增加：攻击1500亿，所有武功350000层。" + "<br>" + "当前已使用" + fengyinsuipian + "个锁链碎片" + "<br>" + "增加攻击" + 1500 * fengyinsuipian + "亿，所有武功" + 350000 * fengyinsuipian + "层";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,10]));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isOthers)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.menghuanFta.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(this.mengHuanTips);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.menghuanFta.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function setAttribute(param1:int) : void
      {
         this.curSelect = param1;
         this.name1.text = this["obj" + param1].zhenFaName;
         if(this["showLv" + param1] == 0)
         {
            this.lv1.text = LanResManager.getLanCommonTextWords("未激活");
         }
         else
         {
            this.lv1.text = LanResManager.getLanCommonTextWords("等级：") + this["showLv" + param1].toString();
         }
         if(this["obj" + param1].status == 0)
         {
            this.preBtn1.enabled = false;
            this.nextBtn1.enabled = false;
         }
         else
         {
            if(this["showLv" + param1] == 1)
            {
               this.preBtn1.enabled = false;
            }
            else
            {
               this.preBtn1.enabled = true;
            }
            if(this["showLv" + param1] == 10)
            {
               this.nextBtn1.enabled = false;
            }
            else
            {
               this.nextBtn1.enabled = true;
            }
         }
         if(this["showLv" + param1] == 0)
         {
            this.tiShengBtn.label = LanResManager.getLanCommonTextWords("可激活");
            this.attribute1.htmlText = "";
         }
         else
         {
            this.attribute1.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("攻击：+") + this["obj" + param1]["lv" + this["showLv" + param1]].gongji + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + this["obj" + param1]["lv" + this["showLv" + param1]].fangyu + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + this["obj" + param1]["lv" + this["showLv" + param1]].hp + "<br>" + (this["obj" + param1]["lv" + this["showLv" + param1]].gongjizhengqiang > 0 ? LanResManager.getLanCommonTextWords("攻击增强比例：") + this["obj" + param1]["lv" + this["showLv" + param1]].gongjizhengqiang + "%<br>" : "") + (this["obj" + param1]["lv" + this["showLv" + param1]].hushifanyu > 0 ? LanResManager.getLanCommonTextWords("忽视防御比例：") + this["obj" + param1]["lv" + this["showLv" + param1]].hushifanyu + "%<br>" : "") + (this["obj" + param1]["lv" + this["showLv" + param1]].hurtfantan > 0 ? LanResManager.getLanCommonTextWords("反弹伤害比例：") + this["obj" + param1]["lv" + this["showLv" + param1]].hurtfantan + "%<br>" : "") + (this["obj" + param1]["lv" + this["showLv" + param1]]
            .hurtjianmian > 0 ? LanResManager.getLanCommonTextWords("伤害减免比例：") + this["obj" + param1]["lv" + this["showLv" + param1]].hurtjianmian + "%<br>" : "") + "</textformat>";
         }
         if(this["showLv" + param1] == this["obj" + param1].status)
         {
            if(this["obj" + param1].status == 10)
            {
               this.tiShengBtn.label = LanResManager.getLanCommonTextWords("已达顶层");
               this.tiShengBtn.enabled = false;
            }
            else if(this["obj" + param1].status == 0)
            {
               this.tiShengBtn.label = LanResManager.getLanCommonTextWords("可激活");
               this.tiShengBtn.enabled = true;
            }
            else
            {
               this.tiShengBtn.enabled = true;
               this.tiShengBtn.label = LanResManager.getLanCommonTextWords("可提升");
            }
         }
         else if(this["showLv" + param1] > this["obj" + param1].status)
         {
            this.tiShengBtn.label = LanResManager.getLanCommonTextWords("尚未提升");
            this.tiShengBtn.enabled = false;
         }
         else if(this["showLv" + param1] < this["obj" + param1].status)
         {
            this.tiShengBtn.label = LanResManager.getLanCommonTextWords("已提升");
            this.tiShengBtn.enabled = false;
         }
         if(this.isOthers)
         {
            this.setEnabledFun();
         }
      }
      
      private function setSiLingZhenAvatar(param1:int) : void
      {
         var index:int = param1;
         switch(index)
         {
            case 1:
               if(this.qinglongAvatar)
               {
                  if(this.qinglongAvatar.parent != null)
                  {
                     this.qinglongAvatar.gotoAndStop(this.showLv1 + 1);
                  }
                  else
                  {
                     this.qinglongAvatar.x = 260;
                     this.qinglongAvatar.y = 25 + 15;
                     this.qinglongAvatar.scaleX = 0.8;
                     this.qinglongAvatar.scaleY = 0.8;
                     this.qinglongAvatar.gotoAndStop(this.showLv1 + 1);
                     this.avatarContainer.addChild(this.qinglongAvatar);
                  }
               }
               else
               {
                  this.qinglongAvatarKey = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/qinglong.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     if(_loc2_.url.url != qinglongAvatarKey)
                     {
                        return;
                     }
                     if(Boolean(qinglongAvatar) && qinglongAvatar.parent != null)
                     {
                        qinglongAvatar.stop();
                        qinglongAvatar.parent.removeChild(qinglongAvatar);
                     }
                     qinglongAvatar = _loc2_.content as MovieClip;
                     if(qinglongAvatar)
                     {
                        qinglongAvatar.x = 260;
                        qinglongAvatar.y = 25 + 15;
                        qinglongAvatar.scaleX = 0.8;
                        qinglongAvatar.scaleY = 0.8;
                        qinglongAvatar.gotoAndStop(showLv1 + 1);
                        avatarContainer.addChild(qinglongAvatar);
                     }
                  },null,false,this.qinglongAvatarKey);
               }
               break;
            case 2:
               if(this.baihuAvatar)
               {
                  if(this.baihuAvatar.parent != null)
                  {
                     this.baihuAvatar.gotoAndStop(this.showLv2 + 1);
                  }
                  else
                  {
                     this.baihuAvatar.x = -5;
                     this.baihuAvatar.y = 25 + 15;
                     this.baihuAvatar.scaleX = 0.8;
                     this.baihuAvatar.scaleY = 0.8;
                     this.baihuAvatar.gotoAndStop(this.showLv2 + 1);
                     this.avatarContainer.addChild(this.baihuAvatar);
                  }
               }
               else
               {
                  this.baihuAvatarKey = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/baihu.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     if(_loc2_.url.url != baihuAvatarKey)
                     {
                        return;
                     }
                     if(Boolean(baihuAvatar) && baihuAvatar.parent != null)
                     {
                        baihuAvatar.stop();
                        baihuAvatar.parent.removeChild(baihuAvatar);
                     }
                     baihuAvatar = _loc2_.content as MovieClip;
                     if(baihuAvatar)
                     {
                        baihuAvatar.x = -5;
                        baihuAvatar.y = 25 + 15;
                        baihuAvatar.scaleX = 0.8;
                        baihuAvatar.scaleY = 0.8;
                        baihuAvatar.gotoAndStop(showLv2 + 1);
                        avatarContainer.addChild(baihuAvatar);
                     }
                  },null,false,this.baihuAvatarKey);
               }
               break;
            case 3:
               if(this.zhuqueAvatar)
               {
                  if(this.zhuqueAvatar.parent != null)
                  {
                     this.zhuqueAvatar.gotoAndStop(this.showLv3 + 1);
                  }
                  else
                  {
                     this.zhuqueAvatar.x = 120 + 10;
                     this.zhuqueAvatar.y = 130 + 5;
                     this.zhuqueAvatar.scaleX = 0.8;
                     this.zhuqueAvatar.scaleY = 0.8;
                     this.zhuqueAvatar.gotoAndStop(this.showLv3 + 1);
                     this.avatarContainer.addChild(this.zhuqueAvatar);
                  }
               }
               else
               {
                  this.zhuqueAvatarKey = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/zhuque.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     if(_loc2_.url.url != zhuqueAvatarKey)
                     {
                        return;
                     }
                     if(Boolean(zhuqueAvatar) && zhuqueAvatar.parent != null)
                     {
                        zhuqueAvatar.stop();
                        zhuqueAvatar.parent.removeChild(zhuqueAvatar);
                     }
                     zhuqueAvatar = _loc2_.content as MovieClip;
                     if(zhuqueAvatar)
                     {
                        zhuqueAvatar.x = 120 + 10;
                        zhuqueAvatar.y = 130 + 5;
                        zhuqueAvatar.scaleX = 0.8;
                        zhuqueAvatar.scaleY = 0.8;
                        zhuqueAvatar.gotoAndStop(showLv3 + 1);
                        avatarContainer.addChild(zhuqueAvatar);
                     }
                  },null,false,this.zhuqueAvatarKey);
               }
               break;
            case 4:
               if(this.xuanwuAvatar)
               {
                  if(this.xuanwuAvatar.parent != null)
                  {
                     this.xuanwuAvatar.gotoAndStop(this.showLv4 + 1);
                  }
                  else
                  {
                     this.xuanwuAvatar.x = 125;
                     this.xuanwuAvatar.y = -50 + 15;
                     this.xuanwuAvatar.scaleX = 0.8;
                     this.xuanwuAvatar.scaleY = 0.8;
                     this.xuanwuAvatar.gotoAndStop(this.showLv4 + 1);
                     this.avatarContainer.addChild(this.xuanwuAvatar);
                  }
               }
               else
               {
                  this.xuanwuAvatarKey = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/xuanwu.swf";
                  LoaderManager.lazyLoad(function(param1:Event):void
                  {
                     var _loc2_:LoadingItem = param1.target as LoadingItem;
                     if(_loc2_.url.url != xuanwuAvatarKey)
                     {
                        return;
                     }
                     if(Boolean(xuanwuAvatar) && xuanwuAvatar.parent != null)
                     {
                        xuanwuAvatar.stop();
                        xuanwuAvatar.parent.removeChild(xuanwuAvatar);
                     }
                     xuanwuAvatar = _loc2_.content as MovieClip;
                     if(xuanwuAvatar)
                     {
                        xuanwuAvatar.x = 125;
                        xuanwuAvatar.y = -50 + 15;
                        xuanwuAvatar.scaleX = 0.8;
                        xuanwuAvatar.scaleY = 0.8;
                        xuanwuAvatar.gotoAndStop(showLv4 + 1);
                        avatarContainer.addChild(xuanwuAvatar);
                     }
                  },null,false,this.xuanwuAvatarKey);
               }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
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
            case this.preBtn1:
               this["showLv" + this.curSelect] = this["showLv" + this.curSelect] - 1;
               this.setAttribute(this.curSelect);
               this.setSiLingZhenAvatar(this.curSelect);
               break;
            case this.nextBtn1:
               this["showLv" + this.curSelect] += 1;
               this.setAttribute(this.curSelect);
               this.setSiLingZhenAvatar(this.curSelect);
               break;
            case this.btn1:
               this.setAttribute(1);
               break;
            case this.btn2:
               this.setAttribute(2);
               break;
            case this.btn3:
               this.setAttribute(3);
               break;
            case this.btn4:
               this.setAttribute(4);
               break;
            case this.jiHuoBtn:
               PipeManager.sendMsg(PipeConstants.SHOW_SI_LIN_ZHEN_YIN_CANG_SHU_XING);
               break;
            case this.tiShengBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_ZHENYAN_CLICK,"",this.curSelect));
         }
      }
      
      private function setJiaChengFta(param1:int = 0, param2:int = 0, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         _loc4_ += this.obj1["lv" + this.obj1.status].gongji + this.obj2["lv" + this.obj2.status].gongji + this.obj3["lv" + this.obj3.status].gongji + this.obj4["lv" + this.obj4.status].gongji + param1;
         _loc5_ += this.obj1["lv" + this.obj1.status].fangyu + this.obj2["lv" + this.obj2.status].fangyu + this.obj3["lv" + this.obj3.status].fangyu + this.obj4["lv" + this.obj4.status].fangyu + param2;
         _loc6_ += this.obj1["lv" + this.obj1.status].hp + this.obj2["lv" + this.obj2.status].hp + this.obj3["lv" + this.obj3.status].hp + this.obj4["lv" + this.obj4.status].hp + param3;
         _loc7_ += this.obj1["lv" + this.obj1.status].gongjizhengqiang + this.obj2["lv" + this.obj2.status].gongjizhengqiang + this.obj3["lv" + this.obj3.status].gongjizhengqiang + this.obj4["lv" + this.obj4.status].gongjizhengqiang;
         _loc8_ += this.obj1["lv" + this.obj1.status].hushifanyu + this.obj2["lv" + this.obj2.status].hushifanyu + this.obj3["lv" + this.obj3.status].hushifanyu + this.obj4["lv" + this.obj4.status].hushifanyu;
         _loc9_ += this.obj1["lv" + this.obj1.status].hurtfantan + this.obj2["lv" + this.obj2.status].hurtfantan + this.obj3["lv" + this.obj3.status].hurtfantan + this.obj4["lv" + this.obj4.status].hurtfantan;
         _loc10_ += this.obj1["lv" + this.obj1.status].hurtjianmian + this.obj2["lv" + this.obj2.status].hurtjianmian + this.obj3["lv" + this.obj3.status].hurtjianmian + this.obj4["lv" + this.obj4.status].hurtjianmian;
         if(this.fireStatus == 1)
         {
            _loc4_ += 40000;
            _loc5_ += 20000;
            _loc6_ += 200000;
            _loc7_ += 5;
            _loc8_ += 5;
            _loc9_ += 4;
            _loc10_ += 4;
         }
         this.zongJiaCheng1.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：+") + _loc4_ + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + _loc5_ + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + _loc6_ + "</font>";
         this.zongJiaCheng2.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击增强比例：") + _loc7_ + "%<br>" + LanResManager.getLanCommonTextWords("忽视防御比例：") + _loc8_ + "%<br>" + LanResManager.getLanCommonTextWords("反弹伤害比例：") + _loc9_ + "%<br>" + LanResManager.getLanCommonTextWords("伤害减免比例：") + _loc10_ + "%</font>";
      }
      
      public function setData(param1:Array, param2:int = 0, param3:int = 1) : void
      {
         var btnUrl:String = null;
         var value:Array = param1;
         var fireStatus:int = param2;
         var select:int = param3;
         this.closeMC();
         this.fireStatus = fireStatus;
         this.dataArr = new Array();
         this.dataArr = value;
         this.obj1 = value[0];
         this.obj2 = value[1];
         this.obj3 = value[2];
         this.obj4 = value[3];
         this.showLv1 = this.obj1.status;
         this.showLv2 = this.obj2.status;
         this.showLv3 = this.obj3.status;
         this.showLv4 = this.obj4.status;
         this.curSelect = select;
         this.setAttribute(this.curSelect);
         this.setSiLingZhenAvatar(1);
         this.setSiLingZhenAvatar(2);
         this.setSiLingZhenAvatar(3);
         this.setSiLingZhenAvatar(4);
         if(Boolean(this.qinglongBtn) && this.qinglongBtn.parent != null)
         {
            this.qinglongBtn.stop();
            this.qinglongBtn.parent.removeChild(this.qinglongBtn);
         }
         btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.obj1["lv" + this.obj1.status].btnid + ".swf";
         if(fireStatus == 1)
         {
            btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/fireqinglongbtn.swf";
         }
         if(this.qinglongBtnKey == btnUrl && Boolean(this.qinglongBtn))
         {
            this.qinglongBtn.play();
            this.btn1.addChild(this.qinglongBtn);
         }
         else
         {
            this.qinglongBtnKey = btnUrl;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != qinglongBtnKey)
               {
                  return;
               }
               if(Boolean(qinglongBtn) && qinglongBtn.parent != null)
               {
                  qinglongBtn.stop();
                  qinglongBtn.parent.removeChild(qinglongBtn);
               }
               qinglongBtn = _loc2_.content as MovieClip;
               if(qinglongBtn)
               {
                  btn1.addChild(qinglongBtn);
               }
            },null,false,this.qinglongBtnKey);
         }
         if(Boolean(this.baihuBtn) && this.baihuBtn.parent != null)
         {
            this.baihuBtn.stop();
            this.baihuBtn.parent.removeChild(this.baihuBtn);
         }
         btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.obj2["lv" + this.obj2.status].btnid + ".swf";
         if(fireStatus == 1)
         {
            btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/firebaihubtn.swf";
         }
         if(this.baihuBtnKey == btnUrl && Boolean(this.baihuBtn))
         {
            this.baihuBtn.play();
            this.btn2.addChild(this.baihuBtn);
         }
         else
         {
            this.baihuBtnKey = btnUrl;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != baihuBtnKey)
               {
                  return;
               }
               if(Boolean(baihuBtn) && baihuBtn.parent != null)
               {
                  baihuBtn.stop();
                  baihuBtn.parent.removeChild(baihuBtn);
               }
               baihuBtn = _loc2_.content as MovieClip;
               if(baihuBtn)
               {
                  btn2.addChild(baihuBtn);
               }
            },null,false,this.baihuBtnKey);
         }
         if(Boolean(this.zhuqueBtn) && this.zhuqueBtn.parent != null)
         {
            this.zhuqueBtn.stop();
            this.zhuqueBtn.parent.removeChild(this.zhuqueBtn);
         }
         btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.obj3["lv" + this.obj3.status].btnid + ".swf";
         if(fireStatus == 1)
         {
            btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/firezhuquebtn.swf";
         }
         if(this.zhuqueBtnKey == btnUrl && Boolean(this.zhuqueBtn))
         {
            this.zhuqueBtn.play();
            this.btn3.addChild(this.zhuqueBtn);
         }
         else
         {
            this.zhuqueBtnKey = btnUrl;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != zhuqueBtnKey)
               {
                  return;
               }
               if(Boolean(zhuqueBtn) && zhuqueBtn.parent != null)
               {
                  zhuqueBtn.stop();
                  zhuqueBtn.parent.removeChild(zhuqueBtn);
               }
               zhuqueBtn = _loc2_.content as MovieClip;
               if(zhuqueBtn)
               {
                  btn3.addChild(zhuqueBtn);
               }
            },null,false,this.zhuqueBtnKey);
         }
         if(Boolean(this.xuanwuBtn) && this.xuanwuBtn.parent != null)
         {
            this.xuanwuBtn.stop();
            this.xuanwuBtn.parent.removeChild(this.xuanwuBtn);
         }
         btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.obj4["lv" + this.obj4.status].btnid + ".swf";
         if(fireStatus == 1)
         {
            btnUrl = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/firexuanwubtn.swf";
         }
         if(this.xuanwuBtnKey == btnUrl && Boolean(this.xuanwuBtn))
         {
            this.xuanwuBtn.play();
            this.btn4.addChild(this.xuanwuBtn);
         }
         else
         {
            this.xuanwuBtnKey = btnUrl;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != xuanwuBtnKey)
               {
                  return;
               }
               if(Boolean(xuanwuBtn) && xuanwuBtn.parent != null)
               {
                  xuanwuBtn.stop();
                  xuanwuBtn.parent.removeChild(xuanwuBtn);
               }
               xuanwuBtn = _loc2_.content as MovieClip;
               if(xuanwuBtn)
               {
                  btn4.addChild(xuanwuBtn);
               }
            },null,false,this.xuanwuBtnKey);
         }
         this.qinglongTitle.htmlText = this.obj1.zhenFaName;
         this.baihuTitle.htmlText = this.obj2.zhenFaName;
         this.zhuqueTitle.htmlText = this.obj3.zhenFaName;
         this.xuanwuTitle.htmlText = this.obj4.zhenFaName;
      }
      
      public function setBuffAvatar(param1:Boolean, param2:int) : void
      {
         var isMain:Boolean = param1;
         var value:int = param2;
         if(Boolean(this.buffAvatar) && this.buffAvatar.parent != null)
         {
            this.buffAvatar.stop();
            this.buffAvatar.parent.removeChild(this.buffAvatar);
         }
         if(value == 0)
         {
            return;
         }
         if(this.buffAvatarKey == GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + value + ".swf")
         {
            if(this.buffAvatar)
            {
               this.buffAvatar.x = 90;
               this.buffAvatar.y = 10;
               this.buffAvatar.scaleX = 0.8;
               this.buffAvatar.scaleY = 0.8;
               this.buffAvatar.play();
               addChild(this.buffAvatar);
               return;
            }
         }
         this.buffAvatarKey = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + value + ".swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != buffAvatarKey)
            {
               return;
            }
            if(Boolean(buffAvatar) && buffAvatar.parent != null)
            {
               buffAvatar.stop();
               buffAvatar.parent.removeChild(buffAvatar);
            }
            buffAvatar = _loc2_.content as MovieClip;
            if(buffAvatar)
            {
               buffAvatar.x = 90;
               buffAvatar.y = 10;
               buffAvatar.scaleX = 0.8;
               buffAvatar.scaleY = 0.8;
               addChild(buffAvatar);
            }
         },null,false,this.buffAvatarKey);
      }
      
      public function setxueshaJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_ID];
            this.qinglongshi = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_QINGLONG_ID];
            this.baihushi = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_BAIHU_ID];
            this.zhuqueshi = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_ZHUQUE_ID];
            this.xuanwushi = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_XUANWU_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_BAOLONGSHOU_ID])
            {
               this.fts3.visible = true;
               this.check.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.check.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_HANTIANLIUJINZHEN_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_WANSHOUMIJI_ID];
            this.sishou = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_SISHOUSUIPIAN_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_SHENBINGFENGYIN_ID];
            this.fengyinsuipian = GameState.dictMainStatus[SpecialGoodsID.SILINGZHEN_FENGYINSUIPIAN_ID];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_ID];
            this.qinglongshi = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_QINGLONG_ID];
            this.baihushi = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_BAIHU_ID];
            this.zhuqueshi = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_ZHUQUE_ID];
            this.xuanwushi = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_XUESHAHUN_XUANWU_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_BAOLONGSHOU_ID])
            {
               this.fts3.visible = true;
               this.check.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.check.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_HANTIANLIUJINZHEN_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_WANSHOUMIJI_ID];
            this.sishou = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_SISHOUSUIPIAN_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_SHENBINGFENGYIN_ID];
            this.fengyinsuipian = GameState.dictTargetStatus[SpecialGoodsID.SILINGZHEN_FENGYINSUIPIAN_ID];
         }
      }
      
      public function closeMC() : void
      {
         if(Boolean(this.qinglongAvatar) && Boolean(this.qinglongAvatar.parent))
         {
            this.qinglongAvatar.parent.removeChild(this.qinglongAvatar);
            this.qinglongAvatar.stop();
         }
         if(Boolean(this.qinglongBtn) && Boolean(this.qinglongBtn.parent))
         {
            this.qinglongBtn.parent.removeChild(this.qinglongBtn);
            this.qinglongBtn.stop();
         }
         if(Boolean(this.baihuAvatar) && Boolean(this.baihuAvatar.parent))
         {
            this.baihuAvatar.parent.removeChild(this.baihuAvatar);
            this.baihuAvatar.stop();
         }
         if(Boolean(this.baihuBtn) && Boolean(this.baihuBtn.parent))
         {
            this.baihuBtn.parent.removeChild(this.baihuBtn);
            this.baihuBtn.stop();
         }
         if(Boolean(this.zhuqueAvatar) && Boolean(this.zhuqueAvatar.parent))
         {
            this.zhuqueAvatar.parent.removeChild(this.zhuqueAvatar);
            this.zhuqueAvatar.stop();
         }
         if(Boolean(this.zhuqueBtn) && Boolean(this.zhuqueBtn.parent))
         {
            this.zhuqueBtn.parent.removeChild(this.zhuqueBtn);
            this.zhuqueBtn.stop();
         }
         if(Boolean(this.xuanwuAvatar) && Boolean(this.xuanwuAvatar.parent))
         {
            this.xuanwuAvatar.parent.removeChild(this.xuanwuAvatar);
            this.xuanwuAvatar.stop();
         }
         if(Boolean(this.xuanwuBtn) && Boolean(this.xuanwuBtn.parent))
         {
            this.xuanwuBtn.parent.removeChild(this.xuanwuBtn);
            this.xuanwuBtn.stop();
         }
         if(Boolean(this.shuoMingCanvas) && Boolean(this.shuoMingCanvas.parent))
         {
            this.shuoMingCanvas.parent.removeChild(this.shuoMingCanvas);
         }
         if(Boolean(this.buffAvatar) && this.buffAvatar.parent != null)
         {
            this.buffAvatar.stop();
            this.buffAvatar.parent.removeChild(this.buffAvatar);
         }
         if(Boolean(this.upgradePanel) && this.upgradePanel.parent != null)
         {
            this.setUpgradePanelVisble(false);
            this.upgradePanel.closeMC();
         }
      }
      
      public function setZhenyan(param1:int, param2:int, param3:int) : void
      {
         if(param1 == 0 && param2 == 0 && param3 == 0)
         {
            this.jiHuoBtn.visible = true;
            this.menghuanFta.visible = false;
         }
         else
         {
            this.mengHuanTips = LanResManager.getLanCommonTextWords("攻击:") + param1 + " " + LanResManager.getLanCommonTextWords("防御:") + param2 + " " + LanResManager.getLanCommonTextWords("血量:") + param3;
            this.menghuanFta.visible = true;
            this.jiHuoBtn.visible = false;
         }
         this.setJiaChengFta(param1,param2,param3);
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = (576 - yanhuaMc.width) / 2;
            yanhuaMc.y = (432 - yanhuaMc.height) / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function resetAutoBtnLabel() : void
      {
         if(this.upgradePanel)
         {
            this.upgradePanel.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
      }
      
      public function setUpgradePanelVisble(param1:Boolean) : void
      {
         if(this.upgradePanel)
         {
            if(param1)
            {
               if(this.upgradePanel.parent)
               {
                  return;
               }
               addChildAt(this.upgradePanel,numChildren);
               this.upgradePanel.x = -90;
               this.upgradePanel.y = 395;
               TweenMax.to(this.upgradePanel,1,{"y":22});
            }
            else
            {
               this.upgradePanel.close();
            }
         }
         else if(param1)
         {
            this.upgradePanel = new SiLingZhenUpgradePanel();
            this.upgradePanel.$parent = this;
            this.upgradePanel.$parent2 = this.$parent;
            addChild(this.upgradePanel);
            this.upgradePanel.x = -90;
            this.upgradePanel.y = 395;
            TweenMax.to(this.upgradePanel,1,{"y":22});
         }
         if(this.upgradePanel)
         {
            this.upgradePanel.updateData();
         }
      }
      
      public function showUpgradePanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Goods, param8:int, param9:int) : void
      {
         var _loc10_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:int = int(this.dataArr.length);
         _loc11_ = 0;
         while(_loc11_ < _loc12_)
         {
            if(this.dataArr[_loc11_].type == param9)
            {
               _loc10_ = this.dataArr[_loc11_];
               break;
            }
            _loc11_++;
         }
         if(this.upgradePanel)
         {
            this.upgradePanel.setUpgradeData(param1,param2,param3,param4,param5,param6,param7,param8,param9,_loc10_);
         }
      }
      
      public function getUseGoodsType() : int
      {
         return this.upgradePanel ? this.upgradePanel.useGoodsType : 0;
      }
      
      public function isSiLingZhenShow() : Boolean
      {
         return this.visible;
      }
      
      public function setEnabledFun() : void
      {
         this.isOthers = true;
         this.tiShengBtn.enabled = false;
         this.shuoMingBtn.enabled = false;
         this.jiHuoBtn.enabled = false;
         this.preBtn1.enabled = false;
         this.nextBtn1.enabled = false;
      }
      
      public function set_HDZB(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer1.numChildren > 0)
         {
            this.equipContainer1.removeChildAt(0);
         }
         while(this.equipContainer2.numChildren > 0)
         {
            this.equipContainer2.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_SILINGZHEN1)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainer1.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_SILINGZHEN2)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainer2.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      public function setQiankunzhu(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.visible = true;
         }
         else
         {
            this.fts.visible = false;
         }
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.textColor = StaticValue.GREEN;
         }
         else
         {
            this.fts1.textColor = StaticValue.RED;
         }
      }
      
      public function setBaolongshou(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
   }
}

