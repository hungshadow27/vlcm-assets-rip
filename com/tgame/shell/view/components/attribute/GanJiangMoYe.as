package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
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
   
   public class GanJiangMoYe extends Sprite
   {
      
      public static const UI_GANJIANGMOYE_GUANBI_CLICK:String = "UI_GANJIANGMOYE_GUANBI_CLICK";
      
      private var gongImg:DisplayObject;
      
      private var gongImgObj:Object;
      
      private var dengji:FTextArea;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var tuichuBtn:SecondButton;
      
      private var duanzaoBtn:FSimpleButton;
      
      private var img:Bitmap;
      
      private var suipian:FTextArea;
      
      private var zuoshuxing:FTextArea;
      
      private var youshuxing:FTextArea;
      
      private var HuanhuaBtn:SecondButton;
      
      private var QianghuaBtn:SecondButton;
      
      public var _$parent:DisplayObject;
      
      private var duanzaoSpr:Sprite;
      
      private var lookingId:int;
      
      private var xingId:int;
      
      private var item:ItemFace;
      
      private var fc1:FCanvas;
      
      private var fireBarMC:MovieClip = null;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var huanhuaTip:String = "";
      
      private var suipianCount:int;
      
      private var goooo:Goods;
      
      private var StarSpr:Sprite;
      
      private var Starbg:DisplayObject;
      
      private var star1:DisplayObject;
      
      private var star2:DisplayObject;
      
      private var star3:DisplayObject;
      
      private var Sint1:int;
      
      private var Sint2:int;
      
      private var Sint3:int;
      
      private var bg1:DisplayObject;
      
      private var yanhuaMc:MovieClip;
      
      private var fts1:FTextArea;
      
      private var xialvshi:int = 0;
      
      private var fts2:FTextArea;
      
      private var shouhushi:int = 0;
      
      private var fts3:FTextArea;
      
      private var fts4:FTextArea;
      
      private var fts5:FTextArea;
      
      private var fts6:FTextArea;
      
      private var fts7:FTextArea;
      
      private var qingyu:int = 0;
      
      private var fts8:FTextArea;
      
      private var check:FCheckBox;
      
      private var fts9:FTextArea;
      
      private var check2:FCheckBox;
      
      private var fts10:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var fts11:FTextArea;
      
      private var check3:FCheckBox;
      
      private var fts12:FTextArea;
      
      private var fts13:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var fts14:FTextArea;
      
      private var checkDt2:FCheckBox;
      
      private var fts15:FTextArea;
      
      public function GanJiangMoYe()
      {
         var duijian:FTextArea;
         this.gongImgObj = {};
         super();
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/bg.swf");
         this.bg1.visible = true;
         this.bg1.x = 0;
         this.bg1.y = 0;
         addChild(this.bg1);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 6 - 20;
         this.bloodMcSpr.y = 9 - 10;
         addChild(this.bloodMcSpr);
         this.mcObj = new Array();
         this.dengji = new FTextArea();
         this.dengji.multiline = true;
         this.dengji.autoSize = TextFieldAutoSize.LEFT;
         this.dengji.wordWrap = true;
         this.dengji.width = 250;
         this.dengji.height = 96;
         this.dengji.x = 35;
         this.dengji.y = 22;
         this.StarSpr = new Sprite();
         this.StarSpr.visible = true;
         addChild(this.StarSpr);
         this.tuichuBtn = new SecondButton();
         this.tuichuBtn.label = LanResManager.getLanCommonTextWords("退出强化");
         addChild(this.tuichuBtn);
         this.tuichuBtn.x = 304;
         this.tuichuBtn.y = 11;
         this.tuichuBtn.visible = false;
         this.tuichuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.duanzaoSpr = new Sprite();
         this.duanzaoSpr.x = 270 - 30;
         this.duanzaoSpr.y = 140;
         this.duanzaoSpr.visible = false;
         addChild(this.duanzaoSpr);
         this.duanzaoBtn = new FSimpleButton();
         this.duanzaoSpr.addChild(this.duanzaoBtn);
         this.duanzaoBtn.x = 66 - 30;
         this.duanzaoBtn.y = 5 - 30 - 20;
         this.duanzaoBtn.skin = "duanzaoBtn";
         this.duanzaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.duanzaoSpr.addChild(this.img);
         this.img.x = 27;
         this.img.y = 30;
         this.suipian = new FTextArea();
         this.suipian.multiline = true;
         this.suipian.autoSize = TextFieldAutoSize.LEFT;
         this.suipian.wordWrap = true;
         this.suipian.width = 250;
         this.suipian.height = 96;
         this.suipian.x = 77;
         this.suipian.y = 30;
         this.duanzaoSpr.addChild(this.suipian);
         duijian = new FTextArea();
         duijian.multiline = true;
         duijian.autoSize = TextFieldAutoSize.LEFT;
         duijian.wordWrap = true;
         duijian.width = 250;
         duijian.height = 96;
         duijian.x = 30 - 25;
         duijian.y = 216 + 15;
         duijian.htmlText = "<textformat ><font size = \'16\'color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("  对剑增加人物属性：") + "</font></textformat>";
         addChild(duijian);
         this.zuoshuxing = new FTextArea();
         this.zuoshuxing.multiline = true;
         this.zuoshuxing.autoSize = TextFieldAutoSize.LEFT;
         this.zuoshuxing.wordWrap = true;
         this.zuoshuxing.width = 250;
         this.zuoshuxing.height = 96;
         this.zuoshuxing.x = 30;
         this.zuoshuxing.y = 216 + 30 + 10;
         this.zuoshuxing.htmlText = "";
         addChild(this.zuoshuxing);
         this.youshuxing = new FTextArea();
         this.youshuxing.multiline = true;
         this.youshuxing.autoSize = TextFieldAutoSize.LEFT;
         this.youshuxing.wordWrap = true;
         this.youshuxing.width = 250;
         this.youshuxing.height = 96;
         this.youshuxing.x = 200;
         this.youshuxing.y = 216 + 30 + 10;
         this.youshuxing.htmlText = "";
         addChild(this.youshuxing);
         this.HuanhuaBtn = new SecondButton();
         this.HuanhuaBtn.label = LanResManager.getLanCommonTextWords("幻化神器");
         this.HuanhuaBtn.x = 60;
         this.HuanhuaBtn.y = 330;
         this.HuanhuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.HuanhuaBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.HuanhuaBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.QianghuaBtn = new SecondButton();
         this.QianghuaBtn.label = LanResManager.getLanCommonTextWords("神器强化");
         addChild(this.QianghuaBtn);
         this.QianghuaBtn.x = 260;
         this.QianghuaBtn.y = 330;
         this.QianghuaBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.QianghuaBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.QianghuaBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 345 - 330;
         this.kuang.y = 14 + 160;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 345 + 2 - 330;
         this.jinengSpr.y = 14 + 2 + 160;
         addChild(this.jinengSpr);
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 44;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170 + 20;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("夫妻同心心法（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：每次可使用侠侣石对夫妻同心心法进行养成属性，每次可增加攻击100亿，") + "<br>" + LanResManager.getLanCommonTextWords("所有武功提升20000层！（最多可养成1000次！）") + "<br>" + LanResManager.getLanCommonTextWords("已养成") + xialvshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + xialvshi * 100 + LanResManager.getLanCommonTextWords("亿  提升武功") + xialvshi * 20000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 44 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170 + 20;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("夫妻守护秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("夫妻守护（特殊技能）：攻击时有几率触发夫妻守护效果，无须夫妻在身边一样拥有夫妻守护效果，") + "<br>" + LanResManager.getLanCommonTextWords("且当夫妻双方都在同一地图时，此效果触发几率将大大翻倍，可达到自身双重复活效果！") + "<br>" + LanResManager.getLanCommonTextWords("养成属性：可使用守护石为激活夫妻守护隐藏属性的玩家养成属性，每次可增加攻击200亿，防御100") + "<br>" + LanResManager.getLanCommonTextWords("亿，所有武功提升10000层！（最多可养成500次！）！") + "<br>" + LanResManager.getLanCommonTextWords("已养成") + shouhushi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + shouhushi * 200 + "亿，防御" + shouhushi * 100 + LanResManager.getLanCommonTextWords("亿  提升武功") + shouhushi * 10000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 44 + 20 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170 + 20;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("龙鸣剑谱（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：30888亿、防御25888亿、血量40888亿、所有武功提升 300000层") + "<br>" + LanResManager.getLanCommonTextWords("龙鸣特技：攻击时有几率触发龙鸣状态，持续5秒；在此状态下，每次攻击对手时都必定震碎对手所有勋") + "<br>" + LanResManager.getLanCommonTextWords("章，且每攻击对手一次都将瞬间掉血80%。") + "<br>" + LanResManager.getLanCommonTextWords("当夫妻地同一场景时，将触发场景技能，龙鸣和凤鸣的触发翻倍，伤害效果翻倍。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 44 + 20 + 40;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170 + 20;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("凤鸣剑谱（已激活）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：30888亿、防御25888亿、血量40888亿、所有武功提升 300000层") + "<br>" + LanResManager.getLanCommonTextWords("凤鸣特技：被击时有几率触发凤鸣状态，持续5秒；在此状态下，自身将不在受到任何负面BUFF的影响，且") + "<br>" + LanResManager.getLanCommonTextWords("每受到一次攻击，都将化解对手的伤害降为0。") + "<br>" + LanResManager.getLanCommonTextWords("当夫妻地同一场景时，将触发场景技能，龙鸣和凤鸣的触发翻倍，伤害效果翻倍。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 44 + 20 + 40 + 20;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170 + 20;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("情侣对戒秘籍（已激活）");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性： 攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("珠联壁合：攻击时有几率触发珠联璧合的状态，持续10秒。在此状态下，每次攻击对手都将麻痹") + "<br>" + LanResManager.getLanCommonTextWords("对手且每麻痹一次对手都将形成壁合特殊技，使5格内的所有玩家都将呆滞原地，持续5秒； 当状态") + "<br>" + LanResManager.getLanCommonTextWords("解除后，场景内将触发夫妻剑壁效果，使所有5格内的玩家瞬间掉血70%。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 44 + 20 + 40 + 20 + 20;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170 + 20;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("夫妻剑技秘籍（已激活）");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：88888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts7 = new FTextArea();
         this.fts7.x = 10 + 285 - 95;
         this.fts7.y = 10;
         this.fts7.textColor = StaticValue.GREEN;
         this.fts7.width = 100;
         this.fts7.height = 20;
         this.fts7.htmlText = LanResManager.getLanCommonTextWords("情缘玉（已激活）");
         this.fts7.visible = false;
         addChild(this.fts7);
         ToolTips.createToolTips(this.fts7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当前已使用") + qingyu + LanResManager.getLanCommonTextWords("颗情缘玉") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + qingyu * 1000 + LanResManager.getLanCommonTextWords("亿，战斗力") + qingyu * 2000 + "";
            return _loc1_ + "</textformat>";
         });
         this.fts8 = new FTextArea();
         this.fts8.x = 10 + 285;
         this.fts8.y = 10 + 20;
         this.fts8.textColor = StaticValue.GREEN;
         this.fts8.width = 170;
         this.fts8.height = 20;
         this.fts8.htmlText = LanResManager.getLanCommonTextWords("雕眷仙侣");
         this.fts8.visible = false;
         addChild(this.fts8);
         ToolTips.createToolTips(this.fts8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("天仙相伴：天池灵兽，瑶池仙子。人物可自己召唤灵兽和仙子，双人骑乘飞翔，战斗 PK。") + "<br>" + LanResManager.getLanCommonTextWords("仙人合体：攻击时有几率触发仙人合体，持续10秒；自身在此状态下，将受到天神的庇护，") + "<br>" + LanResManager.getLanCommonTextWords("无法被任何人锁定，即不受到任何伤害；且自身每攻击一次都将去除对手所有武学，所有") + "<br>" + LanResManager.getLanCommonTextWords("勋章效果，使对手达到完全新手状态。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.selectState = false;
         this.check.x = 10 + 285 + 70;
         this.check.y = 10 + 20;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts9 = new FTextArea();
         this.fts9.x = 10 + 285;
         this.fts9.y = 10 + 20 + 25;
         this.fts9.textColor = StaticValue.GREEN;
         this.fts9.width = 170;
         this.fts9.height = 20;
         this.fts9.htmlText = LanResManager.getLanCommonTextWords("日月神剑");
         this.fts9.visible = false;
         addChild(this.fts9);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.visible = false;
         this.check2.x = 10 + 285 + 70;
         this.check2.y = 10 + 20 + 25;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts10 = new FTextArea();
         this.fts10.x = 10 + 285 - 40;
         this.fts10.y = 10 + 20 + 25 + 20;
         this.fts10.textColor = StaticValue.GREEN;
         this.fts10.width = 170;
         this.fts10.height = 20;
         this.fts10.htmlText = LanResManager.getLanCommonTextWords("日月交替秘籍（已激活）");
         this.fts10.visible = false;
         addChild(this.fts10);
         ToolTips.createToolTips(this.fts10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("佩戴日剑或月剑的玩家，激活日月交替秘籍可开启日月神剑隐藏技能日月交替；") + "<br>" + LanResManager.getLanCommonTextWords("攻击时有几率触发日月交替，持续10秒；在此状态下，若自身持有日剑时，命") + "<br>" + LanResManager.getLanCommonTextWords("中伤害或是技能效果时，可拥有召唤月剑使其代替承受伤害和技能效果，使自") + "<br>" + LanResManager.getLanCommonTextWords("身完全免疫；若自身持月剑时，相反也会召唤日剑代替承受。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 50;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.fts11 = new FTextArea();
         this.fts11.x = 10 + 285 - 40;
         this.fts11.y = 10 + 20 + 25 + 50 + 35;
         this.fts11.textColor = StaticValue.GREEN;
         this.fts11.width = 170;
         this.fts11.height = 20;
         this.fts11.htmlText = LanResManager.getLanCommonTextWords("侠侣屠魔");
         this.fts11.visible = false;
         addChild(this.fts11);
         ToolTips.createToolTips(this.fts11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("侠侣神器：上古神鸟青鸾火凤转化而成，象征着至死不渝的爱情。") + "<br>" + LanResManager.getLanCommonTextWords("屠魔刀魄：攻击时100%触发屠魔刀魄，持续10秒；对手在此状态下，将受到屠魔的威慑所有") + "<br>" + LanResManager.getLanCommonTextWords("能力都将进入延迟模式，对手的攻击速度和移动速度下降至1点；且所有勋章都将被封印无") + "<br>" + LanResManager.getLanCommonTextWords("法触发，直到状态解除后方可触发（效果不可清除）；当状态解除后；对手将受到屠魔神器") + "<br>" + LanResManager.getLanCommonTextWords("的撕砍瞬间一分为二，定身原地，持续10秒。冷却60秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.visible = false;
         this.check3.x = 10 + 285 + 70 - 50;
         this.check3.y = 10 + 20 + 25 + 50 + 35;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts12 = new FTextArea();
         this.fts12.x = 10 + 285 - 40;
         this.fts12.y = 10 + 20 + 25 + 50 + 35 + 20;
         this.fts12.textColor = StaticValue.GREEN;
         this.fts12.width = 80;
         this.fts12.height = 20;
         this.fts12.htmlText = LanResManager.getLanCommonTextWords("凤凰（神器）");
         this.fts12.visible = false;
         addChild(this.fts12);
         ToolTips.createToolTips(this.fts12,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("凤凰：古代传说中凤凰一类的神鸟，雌雄统称，雄为凤，雌为凰.凤凰也称青鸾火凤，寓意为爱情之鸟。青鸾火凤，情比金坚，") + "<br>" + LanResManager.getLanCommonTextWords("象征着至死不渝的爱情。拥有凤凰神器的玩家，男方可获得火凤（神器），女方可获得青鸾（神器）。") + "<br>" + LanResManager.getLanCommonTextWords("青鸾火凤：攻击时100%触发青鸾火凤，持续10秒；在此状态下，自身将同时踩踏青鸾火凤，攻击时将闪现在对手的背影使其") + "<br>" + LanResManager.getLanCommonTextWords("沉睡60秒；且自身瞬间进入空气之中隐形；受到沉睡的对手一旦状态解除，对手将立即陷入黑暗，黑暗中对手将无法触发任") + "<br>" + LanResManager.getLanCommonTextWords("何清除负面状态的效果， 持续15秒。黑暗不可退去，直到状态解除为止。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts13 = new FTextArea();
         this.fts13.x = 10 + 285 - 40 - 195;
         this.fts13.y = 10 + 20 + 25 + 50 + 35 + 20 + 25 - 12;
         this.fts13.textColor = StaticValue.GREEN;
         this.fts13.width = 170;
         this.fts13.height = 20;
         this.fts13.htmlText = "日精灵（神）";
         this.fts13.visible = false;
         addChild(this.fts13);
         ToolTips.createToolTips(this.fts13,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "男性使用，人物将获得超炫精灵守护。" + "<br>" + "攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层" + "<br>" + "特殊技能：攻击时有几率触发日精灵守护状态，持续10秒；自身形成一个超强反噬气场，" + "<br>" + "对手的任何攻击，都会受到气场吞噬，自身完全达到免伤状态，且对手进行的任何操作，" + "<br>" + "都会受到反噬，瞬间掉血80%，且每次必定定身5秒。</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.visible = false;
         this.checkDt.x = 10 + 285 + 70 - 50 - 195 + 15;
         this.checkDt.y = 10 + 20 + 25 + 50 + 35 + 20 + 25 - 12;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts14 = new FTextArea();
         this.fts14.x = 10 + 285 - 40 - 195;
         this.fts14.y = 10 + 20 + 25 + 50 + 35 + 20 + 25 + 25 - 12;
         this.fts14.textColor = StaticValue.GREEN;
         this.fts14.width = 170;
         this.fts14.height = 20;
         this.fts14.htmlText = "月精灵（神）";
         this.fts14.visible = false;
         addChild(this.fts14);
         ToolTips.createToolTips(this.fts14,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "女性使用，人物将获得超炫精灵守护。" + "<br>" + "攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层" + "<br>" + "特殊技能：攻击时有几率触发月灵守护状态，持续10秒；自身形成一个超强反噬气场，" + "<br>" + "对手的任何攻击，都会受到气场吞噬，自身完全达到免伤状态，且对手进行的任何操作，" + "<br>" + "都会受到反噬，瞬间掉血80%，且每次必定定身5秒。</font>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt2 = new FCheckBox();
         addChild(this.checkDt2);
         this.checkDt2.visible = false;
         this.checkDt2.x = 10 + 285 + 70 - 50 - 195 + 15;
         this.checkDt2.y = 10 + 20 + 25 + 50 + 35 + 20 + 25 + 25 - 12;
         this.checkDt2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts15 = new FTextArea();
         this.fts15.x = 10 + 285 - 40 - 195;
         this.fts15.y = 10 + 20 + 25 + 50 + 35 + 20 + 25 + 43;
         this.fts15.textColor = StaticValue.GREEN;
         this.fts15.width = 170;
         this.fts15.height = 20;
         this.fts15.htmlText = "夫妻结合技";
         this.fts15.visible = false;
         addChild(this.fts15);
         ToolTips.createToolTips(this.fts15,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击时100%触发夫妻结合技，持续10秒；在此状态下，自身将召唤元神，在BUFF期间，" + "<br>" + "自身受到的所有伤害及技能效果都将由元神承受；且自身攻击时可瞬间震碎对手的所" + "<br>" + "有勋章，持续10秒；当夫妻的另一方在同一场景时，攻击时将受到夫妻结合技的影响，" + "<br>" + "也有几率召唤元神，获得夫妻结合技的效果。一个激活夫妻拥有。冷却90秒。" + "<br></font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,51]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,71]));
               break;
            case this.check3:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check3.selectState,85]));
               break;
            case this.checkDt:
               this.checkDt2.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,115]));
               break;
            case this.checkDt2:
               this.checkDt.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt2.selectState,116]));
         }
      }
      
      public function onCloseTupo() : void
      {
         this.duanzaoSpr.visible = false;
         this.tuichuBtn.visible = false;
         this.showFireBar(false);
         this.QianghuaBtn.enabled = true;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tuichuBtn:
               this.duanzaoSpr.visible = false;
               this.tuichuBtn.visible = false;
               this.showFireBar(false);
               this.QianghuaBtn.enabled = true;
               break;
            case this.duanzaoBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GANJIANGMOYE_DUANZAO_CLICK,"",this.xingId));
               break;
            case this.QianghuaBtn:
               this.setGoods(this.goooo);
               this.setSuiPianXiaoHao;
               this.duanzaoSpr.visible = true;
               this.tuichuBtn.visible = true;
               this.showFireBar(true);
               this.QianghuaBtn.enabled = false;
               break;
            case this.HuanhuaBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GANJIANGMOYE_HUANHUA_CLICK,"",this.lookingId + 1));
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.QianghuaBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.HuanhuaBtn.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               if(param1.target == this.QianghuaBtn)
               {
                  _loc2_ = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗侠侣碎片可对神器进行强化") + "<br>" + LanResManager.getLanCommonTextWords("提升神器等级并增加神器属性，") + "<br>" + LanResManager.getLanCommonTextWords("但强化时有可能失败降低神器等") + "<br>" + LanResManager.getLanCommonTextWords("级，神器不会消失。") + "<br><br>" + LanResManager.getLanCommonTextWords("夫妻任意一方对神器进行强化") + "<br>" + LanResManager.getLanCommonTextWords("后，另一方也能享受到相同的强") + "<br>" + LanResManager.getLanCommonTextWords("化结果！") + "<br>" + LanResManager.getLanCommonTextWords("夫妻双方无法同时使用本功能") + "</font></textformat>";
                  this.showTip(_loc2_);
               }
               else
               {
                  _loc2_ = this.huanhuaTip;
                  this.showTip(_loc2_);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.QianghuaBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               this.HuanhuaBtn.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
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
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Goods, param13:int, param14:int, param15:int, param16:Boolean, param17:Boolean, param18:Boolean, param19:Boolean, param20:Boolean) : void
      {
         this.isMain = param1;
         this.setBg(param3,param4);
         this.goooo = param12;
         this.setGoods(param12);
         this.setSuiPianXiaoHao(param13,param14);
         this.setShuxingJiacheng(param2,param5,param6,param7,param8,param9,param10,param11);
         this.setSkill(param15,param16);
         if(this.duanzaoSpr.visible == true)
         {
            this.QianghuaBtn.enabled = false;
         }
         this.setGanJiangMoYeHuanZhuang(param17,param18,param19,param20);
      }
      
      public function gouxuan(param1:Boolean, param2:Boolean) : void
      {
         this.checkDt.selectState = param1;
         this.checkDt2.selectState = param2;
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function setBg(param1:int, param2:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var nn:int = param1;
         var id:int = param2;
         if(id == 4)
         {
            this.HuanhuaBtn.enabled = false;
            this.HuanhuaBtn.label = LanResManager.getLanCommonTextWords("幻化封顶");
         }
         else
         {
            this.HuanhuaBtn.enabled = true;
            this.HuanhuaBtn.label = LanResManager.getLanCommonTextWords("幻化神器");
         }
         this.lookingId = id;
         mcId = id;
         if(id == 4)
         {
            this.HuanhuaBtn.enabled = false;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/0" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      private function showFireBar(param1:Boolean) : void
      {
         var b:Boolean = param1;
         if(b)
         {
            if(!this.fireBarMC)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  if(fireBarMC)
                  {
                     return;
                  }
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC = _loc2_.content as MovieClip;
                  fireBarMC.x = -11;
                  fireBarMC.y = 143 - 150;
                  fireBarMC.visible = true;
                  addChildAt(fireBarMC,1);
               },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/huoyan.swf");
            }
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = true;
            }
         }
         else if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
         {
            this.fireBarMC.visible = false;
         }
      }
      
      public function setShuxingJiacheng(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.xingId = param1;
         this.setDengJi(param1);
         this.zuoshuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("生命:+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("攻击:+") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力:+") + param5 + "</font>";
         this.youshuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("体力:+") + param6 + "<br>" + LanResManager.getLanCommonTextWords("暴击:+") + param7 + "<br>" + LanResManager.getLanCommonTextWords("闪避:+") + param8 + "</font>";
      }
      
      public function setDengJi(param1:int) : void
      {
         if(param1 == 150)
         {
            this.QianghuaBtn.enabled = false;
            this.QianghuaBtn.label = LanResManager.getLanCommonTextWords("强化封顶");
         }
         else
         {
            this.QianghuaBtn.enabled = true;
            this.QianghuaBtn.label = LanResManager.getLanCommonTextWords("神器强化");
         }
         while(this.StarSpr.numChildren > 0)
         {
            this.StarSpr.removeChildAt(0);
         }
         if(param1 < 10)
         {
            this.Sint1 = param1;
            this.Sint2 = 0;
            this.Sint3 = 0;
         }
         else if(param1 < 100)
         {
            this.Sint1 = param1 % 10;
            this.Sint2 = param1 / 10;
            this.Sint3 = 0;
         }
         else
         {
            this.Sint1 = param1 % 100 % 10;
            this.Sint2 = param1 % 100 / 10;
            this.Sint3 = param1 / 100;
         }
         this.Starbg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/starbg.swf");
         this.Starbg.visible = true;
         this.Starbg.x = 10;
         this.Starbg.y = 5 + 3;
         this.StarSpr.addChild(this.Starbg);
         this.star1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/" + this.Sint1 + ".swf");
         this.star1.visible = true;
         this.star1.x = 10 + 20 + 20 + 36;
         this.star1.y = 10;
         this.StarSpr.addChild(this.star1);
         this.star2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/" + this.Sint2 + ".swf");
         this.star2.visible = true;
         this.star2.x = 10 + 20 + 36;
         this.star2.y = 10;
         this.StarSpr.addChild(this.star2);
         this.star3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/" + this.Sint3 + ".swf");
         this.star3.visible = true;
         this.star3.x = 10 + 36;
         this.star3.y = 10;
         this.StarSpr.addChild(this.star3);
      }
      
      public function setSuiPianXiaoHao(param1:int, param2:int) : void
      {
         this.suipian.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("剩余：") + this.suipianCount + "</font>";
         this.huanhuaTip = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("消耗") + param2 + LanResManager.getLanCommonTextWords("枚神雕之羽，为干将莫") + "<br>" + LanResManager.getLanCommonTextWords("邪增加更绚丽的外形！") + "<br><br>" + LanResManager.getLanCommonTextWords("神雕之羽通过神雕情缘活动获") + "<br>" + LanResManager.getLanCommonTextWords("得，请在“我的配偶”界面中") + "<br>" + LanResManager.getLanCommonTextWords("申请神雕情缘活动。") + "</font></textformat>";
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.goooo = param1;
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1.id,true);
         this.item = new ItemFace(_loc2_);
         this.item.x = 27 + 2;
         this.item.y = 30 + 2;
         this.duanzaoSpr.addChild(this.item);
         this.suipianCount = _loc2_.count;
         if(_loc2_.count <= 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.item.filters = [];
         }
      }
      
      public function setEnableFun() : void
      {
         this.tuichuBtn.enabled = false;
         this.HuanhuaBtn.enabled = false;
         this.QianghuaBtn.enabled = false;
      }
      
      public function showlihua(param1:Boolean) : void
      {
         var bo:Boolean = param1;
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         if(bo)
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 52 + 15 - 124 + 160 - 137;
               yanhuaMc.y = 60 - 182 - 6 + 200 - 40;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/chenggongTxt.swf");
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               yanhuaMc = _loc2_.content as MovieClip;
               yanhuaMc.x = 52 + 15 - 124 + 160 + 42 - 140;
               yanhuaMc.y = 60 - 182 - 6 + 200 - 15;
               addChild(yanhuaMc);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/ganjiangmoye/shibai.swf");
         }
      }
      
      public function setGanJiangMoYeHuanZhuang(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean) : void
      {
         this.check.selectState = param1;
         this.check2.selectState = param2;
         this.check3.selectState = param3;
         this.fts12.visible = param4;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_FUQITONGXIN_ID];
            this.xialvshi = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_XIALVSHI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_SHOUHU_ID];
            this.shouhushi = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_SHOUHUSHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_LONGMING_ID];
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_FENGMING_ID];
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_QINGLVDUIJIE_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_FUQIJIANJI_ID];
            this.fts7.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_QINGYUANYU_ID];
            this.qingyu = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_QINGYUANYU_ID];
            this.fts8.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_DIAOJUANXIANLV_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_DIAOJUANXIANLV_ID];
            this.fts10.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_RIYUEJIAOTIMIJI_ID];
            this.fts13.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_RIJINGLING_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_RIJINGLING_ID];
            this.fts14.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_YUEJINGLING_ID];
            this.checkDt2.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_YUEJINGLING_ID];
            this.fts15.visible = GameState.dictMainStatus[SpecialGoodsID.GANJIANGMOYE_FUQIJIEHEJI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_FUQITONGXIN_ID];
            this.xialvshi = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_XIALVSHI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_SHOUHU_ID];
            this.shouhushi = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_SHOUHUSHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_LONGMING_ID];
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_FENGMING_ID];
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_QINGLVDUIJIE_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_FUQIJIANJI_ID];
            this.fts7.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_QINGYUANYU_ID];
            this.qingyu = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_QINGYUANYU_ID];
            this.fts8.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_DIAOJUANXIANLV_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_DIAOJUANXIANLV_ID];
            this.fts10.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_RIYUEJIAOTIMIJI_ID];
            this.fts13.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_RIJINGLING_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_RIJINGLING_ID];
            this.fts14.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_YUEJINGLING_ID];
            this.checkDt2.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_YUEJINGLING_ID];
            this.fts15.visible = GameState.dictTargetStatus[SpecialGoodsID.GANJIANGMOYE_FUQIJIEHEJI_ID];
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_GanJiangMoYe(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.equipContainers.addChild(this.kuangHD);
         this.kuangHD.x = 0;
         this.kuangHD.y = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_GANJIANGMOYE_RIYUESHENJIAN)
            {
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.check2.visible = true;
                  this.fts9.visible = true;
               }
               else
               {
                  this.check2.visible = false;
                  this.fts9.visible = false;
               }
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_GANJIANGMOYE_XIALVTUMO)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 40;
               _loc4_.x = 2;
               _loc4_.y = 2 + 40;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.check3.visible = true;
                  this.fts11.visible = true;
               }
               else
               {
                  this.check3.visible = false;
                  this.fts11.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

