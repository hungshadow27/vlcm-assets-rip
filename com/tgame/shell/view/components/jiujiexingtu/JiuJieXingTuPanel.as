package com.tgame.shell.view.components.jiujiexingtu
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.systemculture.TipCanvas;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.skin.JiuJieXingTuSkin;
   import game.utils.SkinTools;
   
   public class JiuJieXingTuPanel extends BasePanel
   {
      
      public static const JIUJIEXINGTUPANEL_FANYE_CLICK:String = "JIUJIEXINGTUPANEL_FANYE_CLICK";
      
      public static const JIUJIEXINGTUPANEL_PEIYANG_CLICK:String = "JIUJIEXINGTUPANEL_PEIYANG_CLICK";
      
      public static const JIUJIEXINGTUPANEL_TASK_CLICK:String = "JIUJIEXINGTUPANEL_TASK_CLICK";
      
      public static const JIUJIEXINGTUPANEL_LINGQU_CLICK:String = "JIUJIEXINGTUPANEL_LINGQU_CLICK";
      
      public static const JIUJIEXINGTUPANEL_BOX_CLICK:String = "JIUJIEXINGTUPANEL_BOX_CLICK";
      
      private var jiuJieXingTu_TaskView:JiuJieXingTu_TaskView;
      
      private var effectMC:MovieClip;
      
      private var yeqian:RadioButtonGroup;
      
      private var yeqian1:RadioButton;
      
      private var yeqian2:RadioButton;
      
      private var yeqian3:RadioButton;
      
      private var currPage:int;
      
      private var currPro:int;
      
      private var equipContainers:Sprite;
      
      public function JiuJieXingTuPanel()
      {
         var shape:Shape;
         var str:String;
         var str1:String;
         var str2:String;
         var str3:String;
         var tipCanvas:TipCanvas = null;
         var tipCanvas1:TipCanvas = null;
         var tipCanvas2:TipCanvas = null;
         var tipCanvas3:TipCanvas = null;
         super();
         this.skin = SkinTools.getChildSkinByName(JiuJieXingTuSkin.skin,"jiujiexingtu");
         this.jiuJieXingTu_TaskView = new JiuJieXingTu_TaskView();
         this.jiuJieXingTu_TaskView._parent = this;
         addChild(this.jiuJieXingTu_TaskView);
         shape = new Shape();
         shape.graphics.beginFill(16711680);
         shape.graphics.drawRect(753,12,328,658);
         shape.graphics.endFill();
         addChild(shape);
         this.jiuJieXingTu_TaskView.mask = shape;
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            effectMC = _loc2_.content as MovieClip;
            effectMC.x = 13;
            effectMC.y = 51;
            effectMC.gotoAndStop(currPro + 1);
            addChild(effectMC);
         },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/jiujiexingtu/effect.swf");
         str = "";
         tipCanvas = new TipCanvas(str,300);
         TipManager.regObj2HasTips($("shiyongshuoming",this,true).getContainer(),null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1.星图分为圣灵尊三系每一系培养可提供的效果不同，三系可同时培养；<br>" + "2.三系培养通过消耗神元石进行提升，加成效果直接增加到角色身上；<br>" + "3.每一系培养最后一个位置可培养20次；<br>" + "4.每一系拥有一个镶嵌位，镶嵌不同宝石可获得当前系效果增幅，宝石可拆卸；<br>" + "5.镶嵌宝石和神元石可通过完成右侧日常任务获取；<br>" + "6.三系培养属性可通过鼠标悬停按钮处查看具体加成效果。" + "</font></textformat>";
            tipCanvas.htmlText = _loc2_;
            return tipCanvas;
         });
         this.equipContainers = new Sprite();
         addChild(this.equipContainers);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         $("^tuxian[0-9]{1}",this,true).attr("visible",false);
         $("guanbi",this,true).click(this.onCloseHandler);
         $("yeqian",this,true).click(this.onClickHandler);
         $("xingtupeiyanganniu",this,true).click(this.onClickHandler);
         str1 = "";
         tipCanvas1 = new TipCanvas(str1,300);
         TipManager.regObj2HasTips(this.yeqian1,null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1星：攻击+20000<br>" + "2星：攻击+2000<br>" + "3星：攻击+4000<br>" + "4星：攻击+6000<br>" + "5星：攻击+30000<br>" + "6星：攻击+5000<br>" + "7星：攻击+7000<br>" + "8星：攻击+9000<br>" + "9星：攻击+11000<br>" + "10星：攻击+13000<br>" + "11星：攻击+15000<br>" + "12星：攻击+50000<br>" + "13星：攻击+14000<br>" + "14星：攻击+16000<br>" + "15星：攻击+18000<br>" + "16星：攻击+20000<br>" + "17星：攻击+22000<br>" + "18星：攻击+24000<br>" + "19星：攻击+26000<br>" + "20星：攻击+28000<br>" + "21星：攻击+30000<br>" + "22星：攻击+100000<br>" + "</font></textformat>";
            tipCanvas1.htmlText = _loc2_;
            return tipCanvas1;
         });
         str2 = "";
         tipCanvas2 = new TipCanvas(str2,300);
         TipManager.regObj2HasTips(this.yeqian2,null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1星：防御+20000<br>" + "2星：防御+2000<br>" + "3星：防御+4000<br>" + "4星：防御+6000<br>" + "5星：防御+30000<br>" + "6星：防御+5000<br>" + "7星：防御+7000<br>" + "8星：防御+9000<br>" + "9星：防御+11000<br>" + "10星：防御+13000<br>" + "11星：防御+15000<br>" + "12星：防御+50000<br>" + "13星：防御+14000<br>" + "14星：防御+16000<br>" + "15星：防御+18000<br>" + "16星：防御+20000<br>" + "17星：防御+22000<br>" + "18星：防御+24000<br>" + "19星：防御+26000<br>" + "20星：防御+28000<br>" + "21星：防御+30000<br>" + "22星：防御+100000<br>" + "</font></textformat>";
            tipCanvas2.htmlText = _loc2_;
            return tipCanvas2;
         });
         str3 = "";
         tipCanvas3 = new TipCanvas(str3,300);
         TipManager.regObj2HasTips(this.yeqian3,null,false,function(param1:DisplayObject):TipCanvas
         {
            var _loc2_:String = "<textformat leading = \'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + "1星：受到的伤害降低5%<br>" + "2星：抵抗丹田武学几率+2%<br>" + "3星：抵抗对方弓箭几率+2%<br>" + "4星：抵抗对方暗器几率+2%<br>" + "5星：攻击5次触发，提升自身2层武功，持续5秒，冷却70秒。<br>" + "6星：暗器伤害减免比例+2%<br>" + "7星：暴击伤害减免比例+2%<br>" + "8星：玄武战纹+2%<br>" + "9星：白虎战纹+2%<br>" + "10星：朱雀战纹+2%<br>" + "11星：青龙战纹+2%<br>" + "12星：攻击3次触发，封印对手技能栏，同时降低对手50%防御，持续6秒，冷却70秒<br>" + "13星：门派绝学+1<br>" + "14星：江湖绝学+1<br>" + "15星：其他绝学+1<br>" + "16星：攻击速度+40<br>" + "17星：移动速度+10<br>" + "18星：血量属性提升1%<br>" + "19星：防御属性提升1%<br>" + "20星：攻击属性提升1%<br>" + "21星：暴击属性+1%<br>" + "22星：所有武功+3<br>" + "</font></textformat>";
            tipCanvas3.htmlText = _loc2_;
            return tipCanvas3;
         });
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,param1);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.currentTarget.name)
         {
            case "yeqian":
               _loc2_ = (param1.currentTarget as RadioButtonGroup).selectIndex;
               dispatchEvent(new BaseEvent(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_FANYE_CLICK,"",_loc2_ + 1));
               break;
            case "xingtupeiyanganniu":
               dispatchEvent(new BaseEvent(JiuJieXingTuPanel.JIUJIEXINGTUPANEL_PEIYANG_CLICK,"",this.currPage));
         }
      }
      
      private function onCloseHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.parent) && parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.yeqian = getChildByName("yeqian") as RadioButtonGroup;
         this.yeqian1 = this.yeqian.getChildByName("yeqian1") as RadioButton;
         this.yeqian2 = this.yeqian.getChildByName("yeqian2") as RadioButton;
         this.yeqian3 = this.yeqian.getChildByName("yeqian3") as RadioButton;
      }
      
      public function setJiuJieXingTuData(param1:Object) : void
      {
         this.currPage = param1.page;
         this.currPro = param1.currPro;
         if(this.effectMC)
         {
            this.effectMC.gotoAndStop(this.currPro + 1);
         }
         $("tu1",this,true).attr("visible",this.currPage == 1 ? true : false);
         $("tu2",this,true).attr("visible",this.currPage == 2 ? true : false);
         $("tu3",this,true).attr("visible",this.currPage == 3 ? true : false);
         $("zizhi2",this,true).attr("visible",true);
         if(this.currPage == 1)
         {
            $("zizhi2",this,true).attr("text","效果增加" + param1.addPercent + "%，攻击：" + param1.addattack);
         }
         else if(this.currPage == 2)
         {
            $("zizhi2",this,true).attr("text","效果增加" + param1.addPercent + "%，防御：" + param1.addattack);
         }
         else if(this.currPage == 3)
         {
            $("zizhi2",this,true).attr("visible",false);
         }
         $("zizhi3",this,true).attr("text","（+" + param1.additionalattack + "）");
         $("zizhi4",this,true).attr("text","需要" + new Goods(param1.goodsID).res.name + "：" + param1.goodsNum);
         $("zizhi5",this,true).attr("text",param1.endPro + "/20");
         var _loc2_:int = 0;
         while(_loc2_ < 22)
         {
            $("tuxian" + (_loc2_ + 1),this,true).attr("visible",_loc2_ < this.currPro ? true : false);
            _loc2_++;
         }
         this.set_JiuJieXingTu(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
      }
      
      public function setJiuJieXingTuTaskData(param1:Object) : void
      {
         this.jiuJieXingTu_TaskView.setJiuJieXingTuTaskData(param1);
      }
      
      public function set_JiuJieXingTu(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         $("zizhi1",this,true).attr("text","");
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            if(_loc3_.res.position == ItemPositionRange.POSITION_JIUJIEXINGTU_EQUIP[0] && this.currPage == 1)
            {
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 359;
               _loc4_.y = 528;
               this.equipContainers.addChild(_loc4_);
               $("zizhi1",this,true).attr("text",_loc3_.res.name);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSITION_JIUJIEXINGTU_EQUIP[1] && this.currPage == 2)
            {
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 359;
               _loc4_.y = 528;
               this.equipContainers.addChild(_loc4_);
               $("zizhi1",this,true).attr("text",_loc3_.res.name);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSITION_JIUJIEXINGTU_EQUIP[2] && this.currPage == 3)
            {
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = 359;
               _loc4_.y = 528;
               this.equipContainers.addChild(_loc4_);
               $("zizhi1",this,true).attr("text",_loc3_.res.name);
            }
            _loc2_++;
         }
      }
   }
}

