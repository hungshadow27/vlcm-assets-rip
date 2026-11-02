package com.tgame.shell.view.components.lliuyueyuanman
{
   import com.asQuery.$;
   import com.asQuery.ASQueryObject;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.utils.TipManager;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.skin.shengjifuli20210722Skin;
   import game.utils.SkinTools;
   
   public class ShengJieDaHuiKuiPanel extends BasePanel
   {
      
      public static const SHENGJIEDAHUIKUI_REQUEST:String = "SHENGJIEDAHUIKUI_REQUEST";
      
      public static const SHENGJIEDAHUIKUI_RECEIVE:String = "SHENGJIEDAHUIKUI_RECEIVE";
      
      public static const SHENGJIEDAHUIKUI_LIBAO:String = "SHENGJIEDAHUIKUI_LIBAO";
      
      public static const SHENGJIEDAHUIKUI_GONGFAJIHUO:String = "SHENGJIEDAHUIKUI_GONGFAJIHUO";
      
      private var bar:ColorBar;
      
      private var boxContainer:Sprite;
      
      private var arr2:Array;
      
      private var index:int;
      
      private var ft:FTextArea;
      
      private var allRadioButton:ASQueryObject;
      
      private var rbg:RadioButtonGroup;
      
      public function ShengJieDaHuiKuiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(shengjifuli20210722Skin.skin,"shengjiedahuikui");
         this.bar = new ColorBar(5,466,10,false);
         this.bar.x = 162;
         this.bar.y = 411;
         addChild(this.bar);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.ft = new FTextArea();
         this.ft.textColor = StaticValue.WHITE;
         this.ft.filters = StaticValue.filter;
         this.ft.x = 382 + 15;
         this.ft.y = 408;
         this.ft.defaultTextFormat = new TextFormat(null,14);
         addChild(this.ft);
         this.ft.mouseEnabled = false;
      }
      
      override protected function createVariableReference() : void
      {
         $("guanbi ",this,true).click(this.onClickHandler);
         $("qutishenganniu",this,true).click(this.onClickHandler);
         $("manfeilingqu",this,true).click(this.onClickHandler);
         $("qucanyuanniu",this,true).click(this.onClickHandler);
         $("dianjigoumai1",this,true).click(this.onClickHandler);
         $("dianjigoumai2",this,true).click(this.onClickHandler);
         $("dianjigoumai3",this,true).click(this.onClickHandler);
         this.allRadioButton = $("huodongyeqian",this,true).find(RadioButton,true);
         this.allRadioButton.click(this.onClickHandler1);
         $("gofamigncheng",this,true).attr("visible",false);
         $("gofamigncheng2",this,true).attr("visible",false);
      }
      
      private function onClickHandler1(param1:MouseEvent) : void
      {
         var _loc2_:int = parseInt(param1.target.name.replace("huodong",""));
         if(_loc2_ > 0)
         {
            dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_REQUEST,"",_loc2_));
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "guanbi":
               if(this.parent)
               {
                  this.parent.removeChild(this);
               }
               break;
            case "qutishenganniu":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_GONGFAJIHUO,"",this.index));
               break;
            case "manfeilingqu":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,"",[this.index,1]));
               break;
            case "qucanyuanniu":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,"",[this.index,2]));
               break;
            case "dianjigoumai1":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,"",[this.index,3]));
               break;
            case "dianjigoumai2":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,"",[this.index,4]));
               break;
            case "dianjigoumai3":
               this.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_LIBAO,"",[this.index,5]));
         }
      }
      
      public function setShengJieDaHuiKuiIsActive(param1:Object) : void
      {
         if(param1.active)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            switch(param1.index)
            {
               case 1:
                  GameInstance.uiInstance.charAttribute.showZhenYanShouYin();
                  GameInstance.uiInstance.charAttribute.requestShowZhenYanShouYin();
                  GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
                  break;
               case 2:
                  GameInstance.uiInstance.charAttribute.showYuejinlun();
                  GameInstance.uiInstance.charAttribute.requestShowYuejinlun();
                  GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
            }
         }
      }
      
      public function setShengJieDaHuiKuiData(param1:Object = null) : void
      {
         var _loc7_:ShengJieDaHuiKuiRender = null;
         this.arr2 = param1.arr2;
         this.index = param1.index;
         while(this.boxContainer.numChildren)
         {
            this.boxContainer.removeChildAt(0);
         }
         $("huodongshijian",this,true).attr("text",param1.time + "\r（小提示：双击升阶道具可快速打开升阶系统面板）");
         var _loc2_:String = new Goods(732674).res.desc;
         TipManager.regObj2HasTips($("chenghaoshuxing",this,true).getContainer(),_loc2_);
         this.bar.setValue(param1.currProgress,param1.totleProgress);
         this.ft.text = param1.currProgress + "/" + param1.totleProgress;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.arr1.length)
         {
            _loc7_ = new ShengJieDaHuiKuiRender();
            param1.arr1[_loc3_].index = this.index;
            _loc7_.setData(param1.arr1[_loc3_]);
            this.boxContainer.addChild(_loc7_);
            _loc7_.x = 139 + 466 * param1.arr1[_loc3_].receivePoint / param1.totleProgress - 18;
            _loc3_++;
         }
         var _loc4_:Array = (param1.addStr as String).split(",");
         $("menpaishuzi1",this,true).attr("text",_loc4_[0]);
         $("menpaishuzi2",this,true).attr("text",_loc4_[1]);
         $("jiachengshuzi1",this,true).attr("text",_loc4_[2]);
         $("jiachengshuzi2",this,true).attr("text",_loc4_[3]);
         $("jiachengshuzi3",this,true).attr("text",_loc4_[4]);
         $("jiachengshuzi4",this,true).attr("text",_loc4_[5]);
         $("jiachengshuzi5",this,true).attr("text",_loc4_[6]);
         $("jiachengshuzi6",this,true).attr("text",_loc4_[7]);
         $("jiachengshuzi7",this,true).attr("text",_loc4_[8]);
         $("jiachengshuzi8",this,true).attr("text",_loc4_[9]);
         var _loc5_:Goods = new Goods(param1.freeGoods);
         var _loc6_:ItemFace = new ItemFace(_loc5_,65,65);
         _loc6_.x = 1070;
         _loc6_.y = 173;
         this.boxContainer.addChild(_loc6_);
         $("manfeilingqu",this,true).attr("enabled",param1.isReceiveFreeGoods == 0 ? false : true);
         _loc3_ = 0;
         _loc3_ = 0;
         while(_loc3_ < param1.arr2.length)
         {
            _loc5_ = new Goods(param1.arr2[_loc3_].goodsID);
            _loc6_ = new ItemFace(_loc5_,65,65);
            _loc6_.x = 768 + _loc3_ * 140;
            _loc6_.y = 573;
            this.boxContainer.addChild(_loc6_);
            _loc3_++;
         }
         this.setChangeByIndex(this.index);
      }
      
      private function setChangeByIndex(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:ItemFace = null;
         var _loc5_:DisplayObject = null;
         switch(param1)
         {
            case 1:
               _loc5_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shengjidali/1.swf");
               _loc5_.x = 308;
               _loc5_.y = 279;
               this.boxContainer.addChild(_loc5_);
               _loc4_ = new ItemFace(new Goods(732674));
               _loc4_.x = 609;
               _loc4_.y = 300;
               this.boxContainer.addChild(_loc4_);
               break;
            case 2:
               _loc5_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shengjidali/2.swf");
               _loc5_.x = 331;
               _loc5_.y = 298;
               this.boxContainer.addChild(_loc5_);
               _loc4_ = new ItemFace(new Goods(732795));
               _loc4_.x = 609;
               _loc4_.y = 300;
               this.boxContainer.addChild(_loc4_);
         }
         this.rbg = getChildByName("huodongyeqian") as RadioButtonGroup;
         this.rbg.selection = this.allRadioButton.get(param1 - 1) as RadioButton;
      }
   }
}

import com.asQuery.$;
import com.tgame.common.GameInstance;
import com.tgame.common.ui.componets.BasePanel;
import com.tgame.common.ui.componets.ItemFace;
import com.tgame.common.vo.item.Goods;
import com.tgame.shell.view.components.lliuyueyuanman.ShengJieDaHuiKuiPanel;
import com.zcp.common.events.BaseEvent;
import flash.events.MouseEvent;
import game.skin.shengjifuli20210722Skin;
import game.utils.SkinTools;

class ShengJieDaHuiKuiRender extends BasePanel
{
   
   private var index:int = 0;
   
   private var receivePoint:int = 0;
   
   private var item:ItemFace;
   
   public function ShengJieDaHuiKuiRender()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(shengjifuli20210722Skin.skin,"lingqu");
   }
   
   override protected function createVariableReference() : void
   {
      $("kelingquanniu1",this,true).click(this.onClickHandler);
   }
   
   private function onClickHandler(param1:MouseEvent) : void
   {
      switch(param1.target.name)
      {
         case "kelingquanniu1":
            GameInstance.uiInstance.shengjifuliPanel.dispatchEvent(new BaseEvent(ShengJieDaHuiKuiPanel.SHENGJIEDAHUIKUI_RECEIVE,"",[this.index,this.receivePoint]));
      }
   }
   
   public function setData(param1:Object) : void
   {
      this.index = param1.index as int;
      this.receivePoint = param1.receivePoint as int;
      if(this.item)
      {
         this.item.parent.removeChild(this.item);
         this.item = null;
      }
      var _loc2_:Goods = new Goods(param1.goodsID);
      this.item = new ItemFace(_loc2_);
      this.item.x = 33;
      this.item.y = 2;
      addChild(this.item);
      $("lingwuyaoqiu",this,true).attr("text","Tất cả " + param1.receivePoint + " cấp");
      $("kelingquanniu1",this,true).attr("enabled",param1.canReceie == 0 ? false : true);
      $("kelingquanniu1",this,true).attr("visible",param1.isReceie == 0 ? false : true);
   }
}
