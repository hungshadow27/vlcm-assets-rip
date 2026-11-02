package com.tgame.shell.view.components.qishazhen
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.qishazhen.model.info.QiShaZhenVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.*;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class QiShaZhen extends Sprite
   {
      
      public static const UI_QISHAZHEN_GUANBI_CLICK:String = "UI_QISHAZHEN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var qishazhen:QiShaZhenTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 7;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var checkTx:FCheckBox;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkWq:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var shenQiFta1:FTextArea;
      
      private var checkWq1:FCheckBox;
      
      private var checkWq2:FCheckBox;
      
      private var shenQiFta2:FTextArea;
      
      private var checkWq3:FCheckBox;
      
      private var shenQiFta3:FTextArea;
      
      private var checkWq4:FCheckBox;
      
      private var shenQiFta4:FTextArea;
      
      private var checkWq5:FCheckBox;
      
      private var shenQiFta5:FTextArea;
      
      private var checkWq6:FCheckBox;
      
      private var shenQiFta6:FTextArea;
      
      private var checkWq7:FCheckBox;
      
      private var shenQiFta7:FTextArea;
      
      private var checkWq8:FCheckBox;
      
      private var shenQiFta8:FTextArea;
      
      private var checkWq9:FCheckBox;
      
      private var shenQiFta9:FTextArea;
      
      private var checkWq10:FCheckBox;
      
      private var shenQiFta10:FTextArea;
      
      private var checkWq11:FCheckBox;
      
      private var shenQiFta11:FTextArea;
      
      private var jiHuoFta2:FTextArea;
      
      private var jiHuoCount2:int = 0;
      
      public function QiShaZhen()
      {
         var title:FTextArea;
         var fjjn:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qishazhen/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 6;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 + 6;
         this.cengshu.y = 230 - 20 + 25 - 18 - 3 + 7;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 6;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20 + 17;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23 - 21 - 13;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("七杀阵") + "</font></textformat>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 230 - 12;
         this.miaoshu.x = 23;
         this.miaoshu.y = 288 + 7 - 21 - 15;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 10 + 20;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 14;
         this.shuxing.y = 288 + 7 - 21 - 15;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.qishazhen = new QiShaZhenTupoCanvas();
         addChild(this.qishazhen);
         this.qishazhen.x = 138;
         this.qishazhen.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.qishazhen.mask = $mask;
         addEventListener(UI_QISHAZHEN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 120;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("七杀阵秘籍");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：66888亿、防御62888亿、血量60888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊技能：攻击时100%触发七杀隐藏秘术，持续20秒；在此状态下，命中对手后，对手每跳跃7次都将瞬间损失") + "<br>" + LanResManager.getLanCommonTextWords("大量的自身血量；且对手瞬间激活身上的七步封禁状态，使得对手所有的能力无法使用，且只可在原地跳跃，无") + "<br>" + LanResManager.getLanCommonTextWords("法前进。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("御剑奥义");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("御剑奥义：御剑于心，运气成剑。人物可在七杀阵面板自由切换。") + "<br>" + LanResManager.getLanCommonTextWords("御剑奥义：攻击时几率触发御剑奥义，持续10秒；在此状态下，御剑于心，运气成剑，自身御剑飞行，") + "<br>" + LanResManager.getLanCommonTextWords("即使被对手打下坐骑，飞剑也能带着自身快速移动，不受下坐骑后移速下降的影响；且在此状态下，") + "<br>" + LanResManager.getLanCommonTextWords("每次挥动进行攻击，无论是否命中对手，对手是否有受伤，都将在对手身边用剑气形成一个无形之剑，") + "<br>" + LanResManager.getLanCommonTextWords("每当无形之剑数量达到3个时，对手将瞬间被禁锢在原地无法动弹，且剑气瞬间对对手造成70%血量伤害。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkTx = new FCheckBox();
         addChild(this.checkTx);
         this.checkTx.visible = false;
         this.checkTx.x = 80;
         this.checkTx.y = 7 + 25;
         this.checkTx.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 7 + 25 * 2;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("紫金良驹");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("紫金良驹：上古良驹，世人对他的外观描述都停留在传说。人物可在七杀阵选择骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("紫金良驹：攻击时有几率触发紫金良驹，持续10秒；在此状态下，良驹助战，提升自身移动") + "<br>" + LanResManager.getLanCommonTextWords("速度3000%，在此移速下，对手完全无法看清捕捉到自身；且在此状态下，因速度的增加攻") + "<br>" + LanResManager.getLanCommonTextWords("击威力大增，每次攻击对对手瞬间造成60%血量伤害；当状态解除时，在战场上留下了数个") + "<br>" + LanResManager.getLanCommonTextWords("自身的残影，对手无法分辨，只能先将残影逐个击破后，方可攻击自身。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.visible = false;
         this.checkZq.x = 80;
         this.checkZq.y = 7 + 25 * 2;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 7 + 25 * 3;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("紫炎（神器）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：80888亿、防御60888亿、血量80888亿、所有武功提升 600000层") + "<br>" + LanResManager.getLanCommonTextWords("紫炎：亦正亦邪的存在。人物可在七杀阵面板选择佩戴。") + "<br>" + LanResManager.getLanCommonTextWords("紫炎焚寂：攻击时100%触发紫炎焚寂，持续10秒；在此状态下，神器全身包围着紫色的火炎，所有对手的") + "<br>" + LanResManager.getLanCommonTextWords("伤害都将紫炎吞噬降为0；且每次攻击对手，对手都将受到紫炎的灼烧，每次灼烧对手，对手的正面BUFF将") + "<br>" + LanResManager.getLanCommonTextWords("被吞噬一个，同时每次灼烧可瞬间使对手生命值下降60%；且对手被吞噬的正面BUFF将叠加到自身身上，") + "<br>" + LanResManager.getLanCommonTextWords("增强自身的状态，持续10秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq = new FCheckBox();
         addChild(this.checkWq);
         this.checkWq.visible = false;
         this.checkWq.x = 80;
         this.checkWq.y = 7 + 25 * 3;
         this.checkWq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.shenQiFta1 = new FTextArea();
         with(this.shenQiFta1)
         {
            x = 10;
            y = 20 + 20 * 4;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "天地戟（神器）";
            visible = false;
         }
         addChild(this.shenQiFta1);
         ToolTips.createToolTips(this.shenQiFta1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发天地划界，持续10秒；对手在此状态下，将受到天地划界的影响，" + "<br>" + "只能待在周围的5格范围之内行动；且对手在天地划界之中，攻击的技能效果也受到限制抑制，" + "<br>" + "无法操作；当状态解除时，对手将陷入在天地缝隙之中，神智混乱，持续10秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq1 = new FCheckBox();
         addChild(this.checkWq1);
         with(this.checkWq1)
         {
            visible = false;
            x = 90 + shenQiFta1.x;
            y = shenQiFta1.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta2 = new FTextArea();
         with(this.shenQiFta2)
         {
            x = 10;
            y = 20 + 20 * 5;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "晴天剑（神器）";
            visible = false;
         }
         addChild(this.shenQiFta2);
         ToolTips.createToolTips(this.shenQiFta2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层" + "<br>" + "特殊技能：攻击时100 % 触发晴空无际，持续20秒；在此状态下，自身获得的所有的负面BUFF状态，" + "<br>" + "必定被晴天之力全部转移到对手身上；且对手在此状态下，被晴天净化全身无法触发任何的技能效果且" + "<br>" + "所有的勋章失去效果，该状态不可清除；当此状态结束后，自身将获得晴天祝福无敌10秒。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq2 = new FCheckBox();
         addChild(this.checkWq2);
         with(this.checkWq2)
         {
            visible = false;
            x = 90 + shenQiFta2.x;
            y = shenQiFta2.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta3 = new FTextArea();
         with(this.shenQiFta3)
         {
            x = 10;
            y = 20 + 20 * 6;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "暴风剑（神器）";
            visible = false;
         }
         addChild(this.shenQiFta3);
         ToolTips.createToolTips(this.shenQiFta3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层" + "<br>" + "特殊技能：攻击时100 % 触发暴风无形，持续20秒；在此状态下，范围五格内的所有对手都将" + "<br>" + "受到暴风的压制影响，无法施展轻功进行跳跃操作；且暴风将幻化成巨大的锁链锁困住对手，使" + "<br>" + "其无法进行攻击任何人，且在暴风之中暴风将撞击所有在暴风内的对手，使对手所有勋章及神" + "<br>" + "器都将抑制失效无法使用，该状态不可清除。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq3 = new FCheckBox();
         addChild(this.checkWq3);
         with(this.checkWq3)
         {
            visible = false;
            x = 90 + shenQiFta3.x;
            y = shenQiFta3.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta4 = new FTextArea();
         with(this.shenQiFta4)
         {
            x = 10;
            y = 20 + 20 * 7;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "心劫（魔器）";
            visible = false;
         }
         addChild(this.shenQiFta4);
         ToolTips.createToolTips(this.shenQiFta4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发心劫因缘，持续10秒；在此状态下，每次攻击对手可对对手造成心劫BUFF，" + "<br>" + "对手在此效果下，内心产生恐惧，行动能力下降至1点；且在此状态下，对手每次跳跃都将呆滞停顿1秒才可" + "<br>" + "继续操作；当状态解除时，对手将持续10秒内无法清除身上的所有负面状态。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq4 = new FCheckBox();
         addChild(this.checkWq4);
         with(this.checkWq4)
         {
            visible = false;
            x = 90 + shenQiFta4.x;
            y = shenQiFta4.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta5 = new FTextArea();
         with(this.shenQiFta5)
         {
            x = 10;
            y = 20 + 20 * 8;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "爆裂旋刺（神器）";
            visible = false;
         }
         addChild(this.shenQiFta5);
         ToolTips.createToolTips(this.shenQiFta5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发爆裂旋刺，持续10秒；在此状态下，每次攻击将立即清除自身身上的所" + "<br>" + "有的负面状态；且被攻击命中的对手，身上发生爆裂，全身麻痹无法操作，持续10秒；当状态解除时，" + "<br>" + "自身将进入旋刺保护之中无敌10秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq5 = new FCheckBox();
         addChild(this.checkWq5);
         with(this.checkWq5)
         {
            visible = false;
            x = 100 + shenQiFta5.x;
            y = shenQiFta5.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta6 = new FTextArea();
         with(this.shenQiFta6)
         {
            x = 10;
            y = 20 + 20 * 9;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "圣裁执行（神器）";
            visible = false;
         }
         addChild(this.shenQiFta6);
         ToolTips.createToolTips(this.shenQiFta6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发圣裁执行，持续10秒；在此状态下，每攻击一个对手可使对" + "<br>" + "手被执行圣裁程序；在此执行过程中，对手无法进行锁定任何对手；且双脚无法离地，移" + "<br>" + "动范围无法超过周围的5格范围之外。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq6 = new FCheckBox();
         addChild(this.checkWq6);
         with(this.checkWq6)
         {
            visible = false;
            x = 100 + shenQiFta6.x;
            y = shenQiFta6.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta7 = new FTextArea();
         with(this.shenQiFta7)
         {
            x = 10;
            y = 20 + 20 * 10;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "噬梦（魔器）";
            visible = false;
         }
         addChild(this.shenQiFta7);
         ToolTips.createToolTips(this.shenQiFta7,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发噬梦天魔，持续10秒；在此状态下，每次攻击都吞噬对手的梦，" + "<br>" + "使对手无法入睡，神智失常；且在此状态下，对手全身的神兵，勋章也进入幻觉之中无法触发；" + "<br>" + "当状态解除时，对手将陷入呆滞之中，持续10秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq7 = new FCheckBox();
         addChild(this.checkWq7);
         with(this.checkWq7)
         {
            visible = false;
            x = 100 + shenQiFta7.x;
            y = shenQiFta7.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta8 = new FTextArea();
         with(this.shenQiFta8)
         {
            x = 160;
            y = 5;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "极冰如意枪（神器）";
            visible = false;
         }
         addChild(this.shenQiFta8);
         ToolTips.createToolTips(this.shenQiFta8,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击88888888888888 防御80888888888888 血量18888888888888暴击 88888闪避 88888所有武功15000000层" + "<br>" + "特殊技能：攻击时100%触发极冰如意，持续30秒；自身在此极冰如意状态下，所有锁定自身极冰如意枪的对手都将失去锁定且瞬间被" + "<br>" + "极冰反噬影响定身于原地，持续20秒；且被定身的对手，受到极冰如意的压制，身上所有佩戴的勋章及符文刻画里激活的道具都将被" + "<br>" + "如意枪限制失去效果，该反噬效果不可清除。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq8 = new FCheckBox();
         addChild(this.checkWq8);
         with(this.checkWq8)
         {
            visible = false;
            x = 110 + shenQiFta8.x;
            y = shenQiFta8.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta9 = new FTextArea();
         with(this.shenQiFta9)
         {
            x = 160;
            y = 5 + 20;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "破光（神器）";
            visible = false;
         }
         addChild(this.shenQiFta9);
         ToolTips.createToolTips(this.shenQiFta9,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发破光，持续10秒；在此状态下，自身每次攻击都可使对手命中破光，" + "<br>" + "对手在破光的作用下，全身上下经脉穴位倒置，对手无法使用内力进行攻击；且在此状态下，对手" + "<br>" + "手脚控制力下降，行动能力只剩下1点；当状态解除时，对手将被限制在原地操作，持续10秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq9 = new FCheckBox();
         addChild(this.checkWq9);
         with(this.checkWq9)
         {
            visible = false;
            x = 110 + shenQiFta9.x;
            y = shenQiFta9.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta10 = new FTextArea();
         with(this.shenQiFta10)
         {
            x = 160;
            y = 5 + 20 * 2;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "斩犹裂天（神器）";
            visible = false;
         }
         addChild(this.shenQiFta10);
         ToolTips.createToolTips(this.shenQiFta10,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击 88888亿、防御80888亿、血量80888亿、所有武功提升 1000000层" + "<br>" + "特殊技能：攻击时有几率触发斩犹裂天，持续10秒；在此状态下，每次攻击对手可使对手被斩" + "<br>" + "犹裂天劈裂，全身装备失去效果；且在此状态下，对手每次跳跃，移动都将被立即牵制回原地；" + "<br>" + "且在此状态下，对手无法触发无敌保护效果。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkWq10 = new FCheckBox();
         addChild(this.checkWq10);
         with(this.checkWq10)
         {
            visible = false;
            x = 110 + shenQiFta10.x;
            y = shenQiFta10.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.shenQiFta11 = new FTextArea();
         with(this.shenQiFta11)
         {
            x = 160;
            y = 5 + 20 * 3;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "紫荆龙斩（神器）";
            visible = false;
         }
         addChild(this.shenQiFta11);
         ToolTips.createToolTips(this.shenQiFta11,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击：80888亿、防御60888亿、血量80888亿、 所有武功提升 600000层" + "<br>" + "特殊技能：攻击时100%触发紫荆龙斩，持续20秒；在此状态下，自身每攻击一个对手，都" + "<br>" + "可使对手立即被紫荆穿刺，经脉尽断无法进行任何攻击操作；且双脚的灵魄被紫荆控制封" + "<br>" + "印在原地，即使对手身躯离开也将瞬间被灵魄牵制拉回原地；且对手的双眼会受到龙斩冲" + "<br>" + "击无法看清任何事物，持续20秒，该状态不可清除。冷却60秒。";
            return _loc1_ + "</textformat>";
         });
         this.checkWq11 = new FCheckBox();
         addChild(this.checkWq11);
         with(this.checkWq11)
         {
            visible = false;
            x = 110 + shenQiFta11.x;
            y = shenQiFta11.y;
            addEventListener(MouseEvent.CLICK,onCheckClick);
         }
         this.jiHuoFta2 = new FTextArea();
         with(this.jiHuoFta2)
         {
            x = 320;
            y = 195;
            textColor = StaticValue.GREEN;
            width = 110;
            height = 20;
            htmlText = "极冰妖姬碎片";
            visible = false;
         }
         addChild(this.jiHuoFta2);
         ToolTips.createToolTips(this.jiHuoFta2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "家激活极冰妖姬后，将开启极冰妖姬隐藏属性，可使用极冰妖姬碎片对该隐藏属性进行养成，" + "<br>" + "每次增加攻击1500亿，所有武功350000层。（最多可养成200次）。" + "<br>" + "当前已使用" + jiHuoCount2 + "极冰妖姬碎片" + "<br>" + "增加攻击" + jiHuoCount2 * 1500 + "亿，所有武功" + jiHuoCount2 * 350000 + "层" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 65;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,231]));
               break;
            case this.checkTx:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkTx.selectState,230]));
               break;
            case this.checkWq:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq.selectState,228]));
               break;
            case this.checkWq1:
               this.checkWq2.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq4.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq1.selectState,393]));
               break;
            case this.checkWq2:
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq4.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq2.selectState,394]));
               break;
            case this.checkWq3:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq4.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq3.selectState,395]));
               break;
            case this.checkWq4:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq4.selectState,396]));
               break;
            case this.checkWq5:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq5.selectState,397]));
               break;
            case this.checkWq6:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq6.selectState,398]));
               break;
            case this.checkWq7:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq7.selectState,399]));
               break;
            case this.checkWq8:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq8.selectState,400]));
               break;
            case this.checkWq9:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq10.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq9.selectState,401]));
               break;
            case this.checkWq10:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq11.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq10.selectState,402]));
               break;
            case this.checkWq11:
               this.checkWq2.selectState = false;
               this.checkWq1.selectState = false;
               this.checkWq3.selectState = false;
               this.checkWq5.selectState = false;
               this.checkWq6.selectState = false;
               this.checkWq7.selectState = false;
               this.checkWq8.selectState = false;
               this.checkWq9.selectState = false;
               this.checkWq10.selectState = false;
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkWq11.selectState,403]));
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHAZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHAZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHAZHEN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.qishazhen._parent2 = param1;
         this.qishazhen._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:QiShaZhenVo) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillId,param2.isLearn);
         this.setJiHuo(param1);
         this.checkWq.selectState = param2.isWuQi;
         this.checkTx.selectState = param2.isTeXiao;
         this.checkZq.selectState = param2.isZuoQi;
         this.checkWq1.selectState = param2.isShenQi1;
         this.checkWq2.selectState = param2.isShenQi2;
         this.checkWq3.selectState = param2.isShenQi3;
         this.checkWq4.selectState = param2.isShenQi4;
         this.checkWq5.selectState = param2.isShenQi5;
         this.checkWq6.selectState = param2.isShenQi6;
         this.checkWq7.selectState = param2.isShenQi7;
         this.checkWq8.selectState = param2.isShenQi8;
         this.checkWq9.selectState = param2.isShenQi9;
         this.checkWq10.selectState = param2.isShenQi10;
         this.checkWq11.selectState = param2.isShenQi11;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_QISHAMIJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_YUJIANAOYI_ID];
            this.checkTx.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_YUJIANAOYI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_ZIJINLIANGJU_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_ZIJINLIANGJU_ID];
            this.jiHuoFta2.visible = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_JIHANSHUIPIAN_ID];
            this.jiHuoCount2 = GameState.dictMainStatus[SpecialGoodsID.QISHAZHEN_JIHANSHUIPIAN_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_QISHAMIJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_YUJIANAOYI_ID];
            this.checkTx.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_YUJIANAOYI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_ZIJINLIANGJU_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_ZIJINLIANGJU_ID];
            this.jiHuoFta2.visible = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_JIHANSHUIPIAN_ID];
            this.jiHuoCount2 = GameState.dictTargetStatus[SpecialGoodsID.QISHAZHEN_JIHANSHUIPIAN_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var mcId:int = param1;
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/qishazhen/" + mcId + ".swf";
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
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("人物属性加成") + "：<br>" + LanResManager.getLanCommonTextWords("攻击:") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御:") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命:") + param4 + "<br>" + LanResManager.getLanCommonTextWords("暴击:") + param5 + "<br>" + LanResManager.getLanCommonTextWords("闪避:") + param6 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
               this.tishengBtn.x = 338;
               this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
               this.tishengBtn.x = 296;
               this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
               this.tishengBtn.x = 326;
               this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7;
            }
         }
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
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.qishazhen.x == 138)
            {
               TweenMax.to(this.qishazhen,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.qishazhen.x == 410)
            {
               TweenMax.to(this.qishazhen,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_QISHAZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.qishazhen.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.qishazhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.qishazhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.qishazhen.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.qishazhen.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_QiShaZhen(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_ZIYANSHENQI)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq.visible = true;
                  this.fts4.visible = true;
               }
               else
               {
                  this.checkWq.visible = false;
                  this.fts4.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[0])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8;
               _loc4_.y = -230;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq1.visible = true;
                  this.shenQiFta1.visible = true;
               }
               else
               {
                  this.checkWq1.visible = false;
                  this.shenQiFta1.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[1])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8;
               _loc4_.y = -230 + 45 * 1;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq2.visible = true;
                  this.shenQiFta2.visible = true;
               }
               else
               {
                  this.checkWq2.visible = false;
                  this.shenQiFta2.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[2])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8;
               _loc4_.y = -230 + 45 * 2;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq3.visible = true;
                  this.shenQiFta3.visible = true;
               }
               else
               {
                  this.checkWq3.visible = false;
                  this.shenQiFta3.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[3])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8;
               _loc4_.y = -230 + 45 * 3;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq4.visible = true;
                  this.shenQiFta4.visible = true;
               }
               else
               {
                  this.checkWq4.visible = false;
                  this.shenQiFta4.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[4])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45;
               _loc4_.y = -230;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq5.visible = true;
                  this.shenQiFta5.visible = true;
               }
               else
               {
                  this.checkWq5.visible = false;
                  this.shenQiFta5.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[5])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45;
               _loc4_.y = -230 + 45 * 1;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq6.visible = true;
                  this.shenQiFta6.visible = true;
               }
               else
               {
                  this.checkWq6.visible = false;
                  this.shenQiFta6.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[6])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45;
               _loc4_.y = -230 + 45 * 2;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq7.visible = true;
                  this.shenQiFta7.visible = true;
               }
               else
               {
                  this.checkWq7.visible = false;
                  this.shenQiFta7.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[7])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45;
               _loc4_.y = -230 + 45 * 3;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq8.visible = true;
                  this.shenQiFta8.visible = true;
               }
               else
               {
                  this.checkWq8.visible = false;
                  this.shenQiFta8.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[8])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45 - 45;
               _loc4_.y = -230 + 45 * 2;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq9.visible = true;
                  this.shenQiFta9.visible = true;
               }
               else
               {
                  this.checkWq9.visible = false;
                  this.shenQiFta9.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[9])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45 - 45;
               _loc4_.y = -230 + 45 * 3;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq10.visible = true;
                  this.shenQiFta10.visible = true;
               }
               else
               {
                  this.checkWq10.visible = false;
                  this.shenQiFta10.visible = false;
               }
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_QISHAZHEN_SHENQI[10])
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               _loc4_.x = 8 - 45 - 45;
               _loc4_.y = -230 + 45 * 4;
               this.kuangHD.x = _loc4_.x - 2;
               this.kuangHD.y = _loc4_.y - 2;
               this.equipContainers.addChild(_loc4_);
               if(_loc4_ != null)
               {
                  this.checkWq11.visible = true;
                  this.shenQiFta11.visible = true;
               }
               else
               {
                  this.checkWq11.visible = false;
                  this.shenQiFta11.visible = false;
               }
            }
            _loc2_++;
         }
      }
   }
}

