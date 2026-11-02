package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.greensock.TweenLite;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
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
   import flash.geom.Point;
   import flash.text.*;
   import gs.easing.Quad;
   
   public class WoDeChuanGong extends Sprite
   {
      
      public const ONEBOX_HEIGHT:int = 70;
      
      public const CHUSHIWEIZHI_X:int = 16;
      
      public const CHUSHIWEIZHI_Y:int = 147;
      
      public const FANWEI_COUNT:int = 30;
      
      public var skillCount1:int = 30;
      
      public var skillCount2:int = 30;
      
      public var skillCount3:int = 30;
      
      public var spr:Sprite;
      
      public var spr1:Sprite;
      
      public var spr2:Sprite;
      
      private var startBtn:SecondButton;
      
      private var goodName:FTextArea;
      
      private var lb:FLabel;
      
      private var selectBtn:FSimpleButton;
      
      private var checkBox:FCheckBox;
      
      private var count:FLabel;
      
      private var countList:FList;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var $parent:DisplayObject;
      
      private var skillArr1:Array;
      
      private var skillArr2:Array;
      
      private var skillArr3:Array;
      
      private var bg0:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var kuang:DisplayObject;
      
      private var ballMc:MovieClip;
      
      private var goodsSpr:Sprite;
      
      private var countBg:F9GridBitmap;
      
      private var miaoShu:FTextArea;
      
      private var img1:Bitmap;
      
      private var shuoMingFta:FTextArea;
      
      private var box:Sprite;
      
      public var goods:ItemFace;
      
      private var fts1:FTextArea;
      
      private var mainSkillContainer1:Sprite;
      
      private var kuang1:Bitmap;
      
      private var currSkill1:ItemFace;
      
      private var p1:Point;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkill1:Skill;
      
      private var mainSkillItemFace2:ItemFace;
      
      private var kuang2:Bitmap;
      
      private var fts2:FTextArea;
      
      private var isLearn1:Boolean;
      
      private var isLearn2:Boolean;
      
      private var fts3:FTextArea;
      
      private var mainSkillItemFace3:ItemFace;
      
      private var isLearn3:Boolean;
      
      private var kuang3:Bitmap;
      
      public function WoDeChuanGong()
      {
         var sprMask:Sprite;
         var sprMask1:Sprite;
         var sprMask2:Sprite;
         super();
         this.bg0 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/chuanGong.swf");
         addChild(this.bg0);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/renwu.swf");
         this.bg1.x = 35;
         addChild(this.bg1);
         this.box = new Sprite();
         this.box.graphics.beginFill(StaticValue.YELLOW,0.5);
         this.box.graphics.drawRect(0,0,225,70);
         this.box.graphics.endFill();
         addChild(this.box);
         this.box.x = 14;
         this.box.y = 214;
         this.goodName = new FTextArea();
         with(this.goodName)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 265;
            y = 180;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("天使传功丹") + "</textformat>";
         }
         addChild(this.goodName);
         this.img1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChildAt(this.img1,1);
         this.img1.x = 280 - 2;
         this.img1.y = 200 - 2;
         this.goodsSpr = new Sprite();
         this.goodsSpr.x = 280;
         this.goodsSpr.y = 200;
         addChild(this.goodsSpr);
         this.countBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.countBg);
         this.countBg.width = 50;
         this.countBg.x = 320;
         this.countBg.y = 209;
         this.miaoShu = new FTextArea();
         with(this.miaoShu)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 260;
            y = 260;
            width = 145;
            wordWrap = true;
            height = 50;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanCommonTextWords("使用不同数量的【天师传功丹】可以将结果翻倍") + "</textformat>";
         }
         addChild(this.miaoShu);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 350;
            y = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("数量");
         }
         addChild(this.lb);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 350;
         this.selectBtn.y = 210;
         this.selectBtn.enabled = true;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 335;
            y = 210;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 330;
         this.listContainer.y = 225;
         this.listContainer.visible = false;
         this.countList = new FList();
         this.countList.listWidth = 16;
         this.countList.x = 3;
         this.countList.y = 2;
         this.countList.dataProvider = <list>
														<node label="0"/>
													</list>;
         this.listContainer.addChild(this.countList);
         this.countList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer.width = this.countList.width + 6;
         this.listContainer.height = 78;
         this.setListCount(9);
         this.scroll = new FVScorllBar(this.countList,74);
         this.listContainer.addChild(this.scroll);
         this.scroll.x = 22;
         this.scroll.y = 2;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始传功");
         addChild(this.startBtn);
         this.startBtn.x = 300;
         this.startBtn.y = 320;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.spr = new Sprite();
         addChild(this.spr);
         this.spr.x = this.CHUSHIWEIZHI_X;
         this.spr.y = this.CHUSHIWEIZHI_Y;
         this.spr.mouseEnabled = false;
         this.spr.mouseChildren = false;
         this.spr1 = new Sprite();
         addChild(this.spr1);
         this.spr1.x = this.CHUSHIWEIZHI_X + 78;
         this.spr1.y = this.CHUSHIWEIZHI_Y;
         this.spr1.mouseEnabled = false;
         this.spr1.mouseChildren = false;
         this.spr2 = new Sprite();
         addChild(this.spr2);
         this.spr2.x = this.CHUSHIWEIZHI_X + 156;
         this.spr2.y = this.CHUSHIWEIZHI_Y;
         this.spr2.mouseEnabled = false;
         this.spr2.mouseChildren = false;
         sprMask = new Sprite();
         sprMask.graphics.clear();
         sprMask.graphics.beginFill(16776960,0.5);
         sprMask.graphics.drawRect(0,0,250,205);
         sprMask.graphics.endFill();
         sprMask.x = this.spr.x - 10;
         sprMask.y = this.spr.y;
         addChild(sprMask);
         sprMask1 = new Sprite();
         sprMask1.graphics.clear();
         sprMask1.graphics.beginFill(16776960,0.5);
         sprMask1.graphics.drawRect(0,0,250,205);
         sprMask1.graphics.endFill();
         sprMask1.x = this.spr.x - 10;
         sprMask1.y = this.spr.y;
         addChild(sprMask1);
         sprMask2 = new Sprite();
         sprMask2.graphics.clear();
         sprMask2.graphics.beginFill(16776960,0.5);
         sprMask2.graphics.drawRect(0,0,250,205);
         sprMask2.graphics.endFill();
         sprMask2.x = this.spr.x - 10;
         sprMask2.y = this.spr.y;
         addChild(sprMask2);
         this.spr.mask = sprMask;
         this.spr1.mask = sprMask1;
         this.spr2.mask = sprMask2;
         this.showBall();
         this.shuoMingFta = new FTextArea();
         this.shuoMingFta.multiline = true;
         this.shuoMingFta.filters = StaticValue.filter;
         this.shuoMingFta.x = 94 + 200;
         this.shuoMingFta.y = 94 + 55;
         addChild(this.shuoMingFta);
         this.shuoMingFta.width = 100;
         this.shuoMingFta.height = 25;
         this.shuoMingFta.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a><u>" + LanResManager.getLanCommonTextWords("玩法说明") + "</u></a></font>";
         ToolTips.createToolTips(this.shuoMingFta,this,function(param1:*, param2:MouseEvent):String
         {
            return "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("点击【开始传功】带有技能的卷轴将会转起") + "<br>" + LanResManager.getLanCommonTextWords("出现任何1个技能图标都将增加100点内功经验") + "<br>" + LanResManager.getLanCommonTextWords("出现2个相同的技能图标将增加400点熟练度") + "<br>" + LanResManager.getLanCommonTextWords("出现3个相同的技能图标将增加3000点熟练度") + "<br>" + "</font></textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10 + 170;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("传承?灵狐幻化秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性： 攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("灵狐幻化（主动技能）：使用之后可将对手变幻为灵狐外观状态，降低对手50%的全属性，") + "<br>" + LanResManager.getLanCommonTextWords("且无法攻击，无法跳跃，效果持续10秒，冷却时间60秒！（可在襄阳城内使用）") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324;
         this.kuang1.y = 160 + 35 - 186;
         this.kuang2 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang2);
         this.kuang2.x = 10;
         this.kuang2.y = 66;
         this.kuang3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang3);
         this.kuang3.x = 25 + 324;
         this.kuang3.y = 160 + 35 - 186 + 50;
         this.mainSkillContainer1 = new Sprite();
         this.mainSkillContainer1.x = 25 + 2 + 324;
         this.mainSkillContainer1.y = 160 + 2 + 35 - 186;
         addChild(this.mainSkillContainer1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp1);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 113;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("金甲战车(已激活)");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("金甲战车：攻城必备战车，扫平城池，指日可待。可锁定任意一个玩家施发金甲战车，") + "<br>" + LanResManager.getLanCommonTextWords("使对手变为金甲战车，瞬间使对手束缚在原地，无法动弹。且对手受到自身控制，当") + "<br>" + LanResManager.getLanCommonTextWords("自身移动到任意位置时，对手也将会被拖动到该位置效果持续10秒，（可在城里使用）") + "<br>" + LanResManager.getLanCommonTextWords("冷却90秒。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 45 + 12 + 100 + 140;
         this.fts3.y = 28 + 20 + 100 + 40 - 20 - 5 - 55;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 42 + 20;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("魔灵之怨");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊效果：锁定任何一个玩家，施发魔灵之怨，使对手受到魔王诅咒变身魔界的") + "<br>" + LanResManager.getLanCommonTextWords("异兽，持续10秒；在此状态下，对手被暗精灵封印，无法挣脱束缚，行动被限制，") + "<br>" + LanResManager.getLanCommonTextWords("且自身将魔灵附体，自身移动到哪，对手变成魔界异兽将跟随魔灵移动，使动手") + "<br>" + LanResManager.getLanCommonTextWords("欲动不能。冷却时间90秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      public function showBall() : void
      {
         var loadUrl:String = null;
         if(this.ballMc != null)
         {
            if(this.ballMc.parent == null)
            {
               addChild(this.ballMc);
               this.ballMc.x = 125;
               this.ballMc.y = 10;
            }
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/ball.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(ballMc) && ballMc.parent != null)
               {
                  ballMc.stop();
                  ballMc.parent.removeChild(ballMc);
               }
               ballMc = _loc2_.content as MovieClip;
               if(ballMc)
               {
                  ballMc.play();
                  addChild(ballMc);
                  ballMc.x = 125;
                  ballMc.y = 10;
               }
            },null,false,loadUrl);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      private function setListCount(param1:int) : void
      {
         var _loc2_:int = 0;
         param1 = param1 > 9 ? 9 : param1;
         var _loc3_:XML = <list></list>;
         _loc2_ = 1;
         while(_loc2_ < param1 + 1)
         {
            _loc3_.appendChild(<node label={_loc2_}/>);
            _loc2_++;
         }
         this.countList.dataProvider = _loc3_;
      }
      
      private function onShowList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.count.text = this.countList.selectItem.label;
         this.listContainer.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDECHUANGONG_START_CLICK,"",parseInt(this.count.text)));
         }
      }
      
      public function setPanel(param1:Goods, param2:Array, param3:Array, param4:Array) : void
      {
         var _loc5_:Skill = null;
         var _loc6_:ItemFace = null;
         this.goodName.htmlText = "<textformat leading=\'6\'>" + param1.res.name + "</textformat>";
         while(this.goodsSpr.numChildren != 0)
         {
            this.goodsSpr.removeChildAt(0);
         }
         this.goodsSpr.addChild(new ItemFace(param1));
         this.skillArr1 = param2;
         this.skillArr2 = param3;
         this.skillArr3 = param4;
         while(this.spr.numChildren > 0)
         {
            _loc6_ = this.spr.removeChildAt(0) as ItemFace;
            _loc6_.destroy();
         }
         while(this.spr1.numChildren > 0)
         {
            _loc6_ = this.spr1.removeChildAt(0) as ItemFace;
            _loc6_.destroy();
         }
         while(this.spr2.numChildren > 0)
         {
            _loc6_ = this.spr2.removeChildAt(0) as ItemFace;
            _loc6_.destroy();
         }
         var _loc7_:int = 0;
         while(_loc7_ < 3)
         {
            _loc5_ = new Skill(param2[_loc7_]);
            _loc6_ = new ItemFace(_loc5_,65,65);
            _loc6_.y = _loc7_ * this.ONEBOX_HEIGHT;
            _loc6_.name = "" + _loc7_;
            _loc6_.setShowCount(false);
            this.spr.addChild(_loc6_);
            _loc5_ = new Skill(param3[_loc7_]);
            _loc6_ = new ItemFace(_loc5_,65,65);
            _loc6_.y = _loc7_ * this.ONEBOX_HEIGHT;
            _loc6_.name = "" + _loc7_;
            _loc6_.setShowCount(false);
            this.spr1.addChild(_loc6_);
            _loc5_ = new Skill(param4[_loc7_]);
            _loc6_ = new ItemFace(_loc5_,65,65);
            _loc6_.y = _loc7_ * this.ONEBOX_HEIGHT;
            _loc6_.name = "" + _loc7_;
            _loc6_.setShowCount(false);
            this.spr2.addChild(_loc6_);
            _loc7_++;
         }
         this.spr.y = this.CHUSHIWEIZHI_Y;
         this.spr1.y = this.CHUSHIWEIZHI_Y;
         this.spr2.y = this.CHUSHIWEIZHI_Y;
         this.setJiHuo(true);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.CHUANCHENG_LINGHUHUANHUA_ID];
            this.isLearn1 = GameState.dictMainStatus[SpecialGoodsID.CHUANCHENG_LINGHUHUANHUA_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.CHUANGONG_JINJIAZHANCHE_ID];
            this.isLearn2 = GameState.dictMainStatus[SpecialGoodsID.CHUANGONG_JINJIAZHANCHE_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.DIZI_CHUANGONG_MOLINGZHIYUAN_ID];
            this.isLearn3 = GameState.dictMainStatus[SpecialGoodsID.DIZI_CHUANGONG_MOLINGZHIYUAN_ID];
            this.setSkillJiHuo1(200234,200359,200368);
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.CHUANCHENG_LINGHUHUANHUA_ID];
            this.isLearn1 = GameState.dictTargetStatus[SpecialGoodsID.CHUANCHENG_LINGHUHUANHUA_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.CHUANGONG_JINJIAZHANCHE_ID];
            this.isLearn2 = GameState.dictTargetStatus[SpecialGoodsID.CHUANGONG_JINJIAZHANCHE_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.DIZI_CHUANGONG_MOLINGZHIYUAN_ID];
            this.isLearn3 = GameState.dictTargetStatus[SpecialGoodsID.DIZI_CHUANGONG_MOLINGZHIYUAN_ID];
            this.setSkillJiHuo1(200234,200359,200368);
         }
      }
      
      public function setResult(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Skill = null;
         var _loc5_:ItemFace = null;
         var _loc7_:int = 0;
         this.skillCount1 = this.FANWEI_COUNT + int(Math.random() * 30);
         this.skillCount2 = this.FANWEI_COUNT + int(Math.random() * 30);
         this.skillCount3 = this.FANWEI_COUNT + int(Math.random() * 30);
         var _loc6_:int = 3;
         _loc6_ = 3;
         while(_loc6_ < this.skillCount1)
         {
            _loc7_ = this.skillArr1.length * Math.random();
            if(this.skillCount1 - 2 == _loc6_)
            {
               _loc4_ = new Skill(param1);
            }
            else
            {
               _loc4_ = new Skill(this.skillArr1[_loc7_]);
            }
            _loc5_ = new ItemFace(_loc4_,65,65);
            _loc5_.y = _loc6_ * this.ONEBOX_HEIGHT;
            _loc5_.name = "" + _loc6_;
            _loc5_.setShowCount(false);
            this.spr.addChild(_loc5_);
            _loc6_++;
         }
         _loc6_ = 3;
         while(_loc6_ < this.skillCount2)
         {
            _loc7_ = this.skillArr2.length * Math.random();
            if(this.skillCount2 - 2 == _loc6_)
            {
               _loc4_ = new Skill(param2);
            }
            else
            {
               _loc4_ = new Skill(this.skillArr2[_loc7_]);
            }
            _loc5_ = new ItemFace(_loc4_,65,65);
            _loc5_.y = _loc6_ * this.ONEBOX_HEIGHT;
            _loc5_.name = "" + _loc6_;
            _loc5_.setShowCount(false);
            this.spr1.addChild(_loc5_);
            _loc6_++;
         }
         _loc6_ = 3;
         while(_loc6_ < this.skillCount3)
         {
            _loc7_ = this.skillArr3.length * Math.random();
            if(this.skillCount3 - 2 == _loc6_)
            {
               _loc4_ = new Skill(param3);
            }
            else
            {
               _loc4_ = new Skill(this.skillArr3[_loc7_]);
            }
            _loc5_ = new ItemFace(_loc4_,65,65);
            _loc5_.y = _loc6_ * this.ONEBOX_HEIGHT;
            _loc5_.name = "" + _loc6_;
            _loc5_.setShowCount(false);
            this.spr2.addChild(_loc5_);
            _loc6_++;
         }
         TweenLite.to(this.spr,3,{
            "y":this.CHUSHIWEIZHI_Y - (this.skillCount1 - 3) * this.ONEBOX_HEIGHT,
            "ease":Quad.easeInOut
         });
         TweenLite.to(this.spr1,3,{
            "y":this.CHUSHIWEIZHI_Y - (this.skillCount2 - 3) * this.ONEBOX_HEIGHT,
            "ease":Quad.easeInOut
         });
         TweenLite.to(this.spr2,3,{
            "y":this.CHUSHIWEIZHI_Y - (this.skillCount3 - 3) * this.ONEBOX_HEIGHT,
            "ease":Quad.easeInOut,
            "onUpdate":this.onUpdate,
            "onComplete":this.onComplete
         });
      }
      
      public function onUpdate() : void
      {
      }
      
      public function onComplete() : void
      {
      }
      
      private function onSkillMouseDown1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         this.p1 = new Point(mouseX,mouseY);
         this.currSkill1 = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill1 != param1.target)
         {
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
            return;
         }
         if(Math.abs(this.p1.x - mouseX) > 5 || Math.abs(this.p1.y - mouseY) > 5 || Math.sqrt(this.p1.x * this.p1.x + this.p1.y * this.p1.y) > 5)
         {
            if((this.currSkill1.getBaseItem() as Skill).res.useway == 1 && (this.currSkill1.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill1));
            }
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         }
      }
      
      private function onSkillMouseUp1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
      }
      
      public function setSkillJiHuo1(param1:int, param2:int, param3:int) : void
      {
         while(this.mainSkillContainer1.numChildren > 0)
         {
            this.mainSkillContainer1.removeChildAt(0);
         }
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
            }
         }
         if(this.mainSkillItemFace2)
         {
            if(this.mainSkillItemFace2.parent)
            {
               this.mainSkillItemFace2.parent.removeChild(this.mainSkillItemFace2);
            }
         }
         if(this.mainSkillItemFace3)
         {
            if(this.mainSkillItemFace3.parent)
            {
               this.mainSkillItemFace3.parent.removeChild(this.mainSkillItemFace3);
            }
         }
         var _loc4_:Skill = new Skill(param1);
         this.mainSkill1 = _loc4_;
         this.mainSkill1.isLearn = 1;
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill1);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillContainer1.addChild(this.mainSkillItemFace1);
         var _loc5_:Skill = new Skill(param2);
         _loc5_.isLearn = 1;
         this.mainSkillItemFace2 = new ItemFace(_loc5_);
         this.mainSkillItemFace2.showKungFuTag();
         this.mainSkillItemFace2.setShowCount(false);
         this.mainSkillItemFace2.x = -330 - 7 - 2;
         this.mainSkillItemFace2.y = 113 - 63 + 6 + 1;
         this.mainSkillContainer1.addChild(this.mainSkillItemFace2);
         var _loc6_:Skill = new Skill(param3);
         _loc6_.isLearn = 1;
         this.mainSkillItemFace3 = new ItemFace(_loc6_);
         this.mainSkillItemFace3.showKungFuTag();
         this.mainSkillItemFace3.setShowCount(false);
         this.mainSkillItemFace3.y = 50;
         this.mainSkillContainer1.addChild(this.mainSkillItemFace3);
         if(this.isLearn1)
         {
            this.mainSkillItemFace1.visible = true;
            this.kuang1.visible = true;
         }
         else
         {
            this.mainSkillItemFace1.visible = false;
            this.kuang1.visible = false;
         }
         if(this.isLearn2)
         {
            this.mainSkillItemFace2.visible = true;
            this.kuang2.visible = true;
         }
         else
         {
            this.mainSkillItemFace2.visible = false;
            this.kuang2.visible = false;
         }
         if(this.isLearn3)
         {
            this.mainSkillItemFace3.visible = true;
            this.kuang3.visible = true;
         }
         else
         {
            this.mainSkillItemFace3.visible = false;
            this.kuang3.visible = false;
         }
      }
   }
}

