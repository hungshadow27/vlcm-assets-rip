package com.tgame.shell.view.components.ride
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TongLingCanvasNew extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var ft_Num:FTextArea;
      
      private var ft_lqd:FTextArea;
      
      private var btnJihuo:SecondButton;
      
      private var btnZhiZao:SecondButton;
      
      private var ftLink:FTextArea;
      
      private var itemContainer:Sprite;
      
      private var ftJinDu:FTextArea;
      
      private var bg:DisplayObject;
      
      private var lqd:DisplayObject;
      
      private var zzlqd:Boolean = false;
      
      private var ftSkill:FTextArea;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      public var $parent:DisplayObject;
      
      private var equipContainer:Sprite;
      
      private var slots:Sprite;
      
      private var slotsBg:Sprite;
      
      private var img:Bitmap;
      
      private var SkillAr:Array;
      
      private var SkillCount:int;
      
      private var fc2:FCanvas;
      
      private var gongMc:MovieClip;
      
      private var loadUrl1:String = "";
      
      public function TongLingCanvasNew()
      {
         var line:DisplayObject = null;
         this.SkillAr = new Array();
         super();
         line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.line.swf");
         line.x = 0;
         line.y = 17;
         addChild(line);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.bg.swf");
         this.bg.x = 0;
         this.bg.y = 20;
         addChild(this.bg);
         line = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ride/ui.ride.line.swf");
         line.x = 0;
         line.y = 203 + 7;
         addChild(line);
         this.fc2 = new FCanvas();
         this.fc2.x = 0;
         this.fc2.y = 0;
         this.fc2.width = 330;
         this.fc2.height = 260;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this.fc2 = new FCanvas();
         this.fc2.x = 0;
         this.fc2.y = 270 + 20 - 3 + 10;
         this.fc2.width = 330;
         this.fc2.height = 75;
         this.fc2.skin = "box";
         addChild(this.fc2);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 0;
         this.ft.width = 320;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙鳞圣兽以上的坐骑，使用通灵丹，可激活通灵天赋") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 210;
         this.ft.y = 25;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活进度：") + "</font>";
         addChild(this.ft);
         this.ftJinDu = new FTextArea();
         this.ftJinDu.x = 270;
         this.ftJinDu.y = 25;
         this.ftJinDu.htmlText = "";
         addChild(this.ftJinDu);
         this.btnJihuo = new SecondButton();
         this.btnJihuo.x = 60;
         this.btnJihuo.y = 215;
         this.btnJihuo.label = LanResManager.getLanCommonTextWords("激活通灵");
         this.btnJihuo.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每次消耗1颗【通灵丹】，100%几率可以增加5%的激活进度，激活进度到达100%时，可以制造【龙气丹】。") + "</font>";
         addChild(this.btnJihuo);
         this.btnJihuo.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnZhiZao = new SecondButton();
         this.btnZhiZao.x = 200;
         this.btnZhiZao.y = 215;
         this.btnZhiZao.label = LanResManager.getLanCommonTextWords("点此制造");
         this.btnZhiZao.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天最多可以制造一颗【龙气丹】") + "</font>";
         addChild(this.btnZhiZao);
         this.btnZhiZao.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ft_Num = new FTextArea();
         this.ft_Num.x = 150 - 30;
         this.ft_Num.y = 220 + 18;
         this.ft_Num.width = 123;
         this.ft_Num.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("累计制造【N颗】") + "</font>";
         addChild(this.ft_Num);
         this.ft_lqd = new FTextArea();
         this.ft_lqd.x = this.ft_Num.x + this.ft_Num.width;
         this.ft_lqd.y = 220 + 18;
         this.ft_lqd.htmlText = "<a href=\'event:\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("龙气丹") + "</font></a>";
         ToolTips.createToolTips(this.ft_lqd,this,function(param1:*, param2:MouseEvent):String
         {
            return LanResManager.getLanCommonTextWords("由龙鳞圣兽以上神兽孕育而出，具有神奇效果，使用后，在30分钟内将增加50%的人物生命值上限。") + "<br>" + LanResManager.getLanCommonTextWords("【该物品由通灵龙鳞圣兽以上神兽所孕育，一天可产一颗】") + "<br>" + LanResManager.getLanCommonTextWords("【该丹药将也可以被带入跨服战场中使用】");
         });
         addChild(this.ft_lqd);
         this.ft = new FTextArea();
         this.ft.x = 135;
         this.ft.y = 220 + 20 + 20;
         this.ft.htmlText = "<font size=\'14\' color=\'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("组合技能") + "</font>";
         addChild(this.ft);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            width = 330;
            height = 40;
            x = 0;
            y = 255 + 20 - 8 + 10;
            filters = StaticValue.filter;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'4\'><font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanCommonTextWords("【傲世炎豹】有2个组合技能") + " -> " + LanResManager.getLanCommonTextWords("【紫金麒麟】有3个组合技能") + "</font></textformat>";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 260;
            height = 20;
            x = 10;
            y = 270 + 20 + 15;
            filters = StaticValue.filter;
            textColor = StaticValue.ORANGE;
            wordWrap = true;
            htmlText = LanResManager.getLanCommonTextWords("请放入要组合的技能");
         }
         addChild(this.fta);
         this.ftLink = new FTextArea();
         this.ftLink.x = 170;
         this.ftLink.y = 270 + 20 + 15;
         this.ftLink.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:" + LanResManager.getLanCommonTextWords("组合技能说明") + "\'><u>" + LanResManager.getLanCommonTextWords("组合技能说明") + "</u></a></font>";
         this.ftLink.addEventListener(MouseEvent.CLICK,this.onLink);
         addChild(this.ftLink);
         this.img = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot");
         addChild(this.img);
         this.img.x = 12;
         this.img.y = 292 + 16 + 15;
         this.slotsBg = new Sprite();
         with(this.slotsBg)
         {
            x = 12;
            y = 292 + 16 + 15;
         }
         addChild(this.slotsBg);
         this.equipContainer = new Sprite();
         addChild(this.equipContainer);
         this.equipContainer.x = 12;
         this.equipContainer.y = 292 + 16 + 15;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,180,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onEquip,false,30);
         this.fta = new FTextArea();
         with(this.fta)
         {
            width = 125;
            height = 45;
            x = 202;
            y = 295 + 12 + 15;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN;
            wordWrap = true;
         }
         this.fta.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(UpgradeAssembledSkillCanvas,"坐骑组合技触发说明") + "</textformat>";
         addChild(this.fta);
         this.lqd = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/ride/tonglingdan.swf");
         this.lqd.x = 128;
         this.lqd.y = 138;
         addChild(this.lqd);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnJihuo:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT));
               this.zzlqd = false;
               break;
            case this.btnZhiZao:
               this.zzlqd = true;
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE));
         }
      }
      
      private function onLink(param1:MouseEvent) : void
      {
         var _loc2_:String = LanResManager.getLanCommonTextWords("在您将已掌握的武学技能图标拖入到骑乘的组合技能栏后，您在打怪或PK过程中，") + "<br>" + LanResManager.getLanCommonTextWords("您所骑乘的坐骑就会自动配合您主动使用这些武学来攻击敌人。 您所拖入的武学必") + "<br>" + LanResManager.getLanCommonTextWords("须是特别类武学；组合技命中敌人后，并不会造成攻击伤害，但会附加特殊武学的") + "<br>" + LanResManager.getLanCommonTextWords("特殊效果。例如：【大金刚力】的击退效果，【点穴截脉】的定身效果，【五毒奇") + "<br>" + LanResManager.getLanCommonTextWords("经】的中毒效果，【吸星大法】的吸血效果，【化功大法】的封内力效果，【绵骨") + "<br>" + LanResManager.getLanCommonTextWords("大法】的封体力效果，【脱袍裂甲】的封防御力效果，【白手格刃】的封攻击力效果。") + "<br>" + LanResManager.getLanCommonTextWords("您放入的武学技能越多，则将同时附加给敌人的负面效果也就会越多。");
         FAlert.show(_loc2_,LanResManager.getLanCommonTextWords("坐骑组合技能说明"));
      }
      
      private function onEquip(param1:MouseEvent) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         var _loc5_:BaseItem = null;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc2_:int = param1.currentTarget.mouseX / 47;
         if(_loc2_ < this.SkillCount)
         {
            _loc6_ = false;
            _loc7_ = 0;
            while(_loc7_ < this.SkillAr.length)
            {
               _loc3_ = this.SkillAr[_loc7_] as Skill;
               if(_loc3_.position == _loc2_ + 1)
               {
                  _loc4_ = new ItemFace(_loc3_);
                  _loc6_ = true;
                  break;
               }
               _loc6_ = false;
               _loc7_++;
            }
            if(_loc6_)
            {
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,"",[_loc4_,_loc2_ + 1]));
            }
            else
            {
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,"",[null,_loc2_ + 1]));
            }
         }
      }
      
      public function setTongLingDan(param1:Goods, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.ftJinDu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + String(param3) + "%</font>";
         if(param3 == 100)
         {
            this.btnJihuo.label = LanResManager.getLanCommonTextWords("已通灵");
            this.btnJihuo.enabled = false;
         }
         else
         {
            this.btnJihuo.label = LanResManager.getLanCommonTextWords("开始通灵");
            this.btnJihuo.enabled = true;
         }
      }
      
      public function setLongQiDan(param1:Goods, param2:int) : void
      {
         this.ft_Num.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("累计制造【") + String(param2) + LanResManager.getLanCommonTextWords("颗】") + "</font>";
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc3_ == "gongMc")
         {
            if(_loc2_.url.url != this.loadUrl1)
            {
               return;
            }
            if(this.gongMc != null && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            this.gongMc = _loc2_.content as MovieClip;
            if(this.gongMc)
            {
               this.gongMc.x = 1;
               this.gongMc.y = 72;
               addChild(this.gongMc);
            }
         }
      }
      
      public function SetInitialize(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         if(param5 == 0)
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(UpgradeAssembledSkillCanvas,"只有[赤焰魔狮]以上") + "</textformat>";
         }
         else if(param5 == 4)
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(UpgradeAssembledSkillCanvas,"龙鳞圣兽拥有四项组合技同时生效的使用能力",[param1,param2]) + "</textformat>";
         }
         else
         {
            this.fta1.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(UpgradeAssembledSkillCanvas,"当前坐骑拥有组合技能",[param1,param2]) + "<br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(UpgradeAssembledSkillCanvas,"下阶坐骑拥有组合技能",[param3,param4]) + "</font>" + "</textformat>";
         }
         this.SkillCount = param5;
         while(this.slotsBg.numChildren > 0)
         {
            this.slotsBg.removeChildAt(0);
         }
         var _loc6_:int = int(param5);
         while(_loc6_ < 4)
         {
            this.img = StaticValue.getBitmapByClassName("ui.ride.skill.assembled.skill.slot.lock");
            this.slotsBg.addChild(this.img);
            this.img.x = _loc6_ * 47;
            this.img.y = 0;
            _loc6_++;
         }
      }
      
      public function SetSkillInitialize(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:BaseItem = null;
         var _loc4_:Skill = null;
         this.SkillAr = param1;
         while(this.equipContainer.numChildren > 0)
         {
            _loc2_ = this.equipContainer.getChildAt(0) as ItemFace;
            this.equipContainer.removeChildAt(0);
            _loc2_.destroy();
         }
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc3_ = param1[_loc5_];
            _loc4_ = param1[_loc5_] as Skill;
            _loc2_ = new ItemFace(_loc4_);
            _loc2_.x = (_loc4_.position - 1) * 47 + 2;
            _loc2_.y = 0 + 2;
            if(_loc4_.position <= 4)
            {
               this.equipContainer.addChild(_loc2_);
            }
            _loc5_++;
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function setMC() : void
      {
         var _loc1_:Array = null;
         if(this.zzlqd)
         {
            this.lqd.visible = false;
            if(this.gongMc != null && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/ui/ride/longtou.swf";
            _loc1_ = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc")];
            LoaderManager.load(_loc1_);
            this.lqd.visible = true;
         }
      }
   }
}

