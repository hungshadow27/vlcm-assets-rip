package com.tgame.moudels.Item.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.ItemTipData;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.Item.view.Item_BackpackMediator;
   import com.zcp.common.utils.Fun;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Item_TipProxy extends Proxy
   {
      
      public static const NAME:String = "Item_TipProxy";
      
      private var _itemTipArr:Object = new Object();
      
      private var _otherItemTipObj:Object = new Object();
      
      private var _npcItemTipObj:Object = new Object();
      
      private var _baoxiangItemTipObj:Object = new Object();
      
      private var _qiankunItemTipObj:Object = {};
      
      private var _huShenFu_SheLiZiItemTipObj:Object = new Object();
      
      private var _nextLevelEquTipData:ItemTipData;
      
      private var _currentItemPos:Point;
      
      private var _itemTipData1:ItemTipData;
      
      private var _itemTipData2:ItemTipData;
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _itemSender:Item_MsgSenderProxy;
      
      private var _itemTipProxy:Item_TipProxy;
      
      public function Item_TipProxy(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      public function get itemSender() : Item_MsgSenderProxy
      {
         if(this._itemSender == null)
         {
            this._itemSender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._itemSender;
      }
      
      public function createItemTip(param1:BaseItem, param2:Point = null, param3:BaseItem = null, param4:ItemFace = null) : void
      {
         var _loc5_:Goods = null;
         this._currentItemPos = param2;
         if(param1 is Goods)
         {
            _loc5_ = param1 as Goods;
            if(_loc5_.roleID == -800 || _loc5_.roleID == -801)
            {
               this._nextLevelEquTipData = new ItemTipData(param1);
               this._itemTipData1 = this._nextLevelEquTipData;
            }
            else if(_loc5_.roleID == -111)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._qiankunItemTipObj[_loc5_.position] = this._itemTipData1;
            }
            else if(_loc5_.roleID == -100)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._baoxiangItemTipObj[_loc5_.position] = this._itemTipData1;
            }
            else if(_loc5_.roleID == -110)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._huShenFu_SheLiZiItemTipObj[_loc5_.position] = this._itemTipData1;
            }
            else if(_loc5_.roleID == -99)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._npcItemTipObj[param1.position] = this._itemTipData1;
            }
            else if(this._itemTipArr[param1.position] == null)
            {
               if(ItemPositionRange.inBody(param1.position))
               {
                  this._itemTipData1 = new ItemTipData(param1,ItemTipData.TYPE_2);
               }
               else
               {
                  this._itemTipData1 = new ItemTipData(param1);
               }
               if(_loc5_.roleID != GameInstance.mainChar.id)
               {
                  this._itemTipData1 = new ItemTipData(param1);
                  this._otherItemTipObj[param1.position] = this._itemTipData1;
               }
               else if(param1.position != 0)
               {
                  if(this._itemTipData1._currentItem != param1)
                  {
                     this._itemTipData1 = new ItemTipData(param1);
                     this._itemTipArr[param1.position] = this._itemTipData1;
                  }
                  else
                  {
                     this._itemTipArr[param1.position] = this._itemTipData1;
                  }
               }
            }
            else if(ItemPositionRange.inMountBody(param1.position))
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._itemTipArr[param1.position] = this._itemTipData1;
            }
            else if(ItemPositionRange.inBooth(param1.position))
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._itemTipArr[param1.position] = this._itemTipData1;
            }
            else if(_loc5_.roleID != GameInstance.mainChar.id)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._otherItemTipObj[param1.position] = this._itemTipData1;
            }
            else if(param1.position > 2718 && param1.position < 4000)
            {
               this._itemTipArr[param1.position] = this._itemTipData1;
               this._itemTipData1 = new ItemTipData(param1);
            }
            else if(param1.position >= 310 && param1.position <= 320)
            {
               this._itemTipData1 = new ItemTipData(param1);
               this._itemTipArr[param1.position] = this._itemTipData1;
            }
            else if(_loc5_.res.position == ItemPositionRange.POSITION_XIANGLONGJIEZHI || _loc5_.res.position == ItemPositionRange.POSITION_XIANGLONGSHENJIAN || _loc5_.res.position == ItemPositionRange.POSITION_YAYUEDAO)
            {
               this.dynamicAttr(param1);
               this._itemTipData1 = this._itemTipArr[param1.position];
            }
            else
            {
               this._itemTipData1 = this._itemTipArr[param1.position];
               if(this._itemTipData1._currentItem != param1)
               {
                  this._itemTipData1 = new ItemTipData(param1);
                  this._itemTipArr[param1.position] = this._itemTipData1;
               }
            }
            if(param3 != null)
            {
               if(this._itemTipArr[param3.position] == null)
               {
                  this._itemTipData2 = new ItemTipData(param3,ItemTipData.TYPE_2);
                  this._itemTipArr[param3.position] = this._itemTipData2;
               }
               else
               {
                  this._itemTipData2 = this._itemTipArr[param3.position];
               }
            }
            if(!this._itemTipData1.isAppendData)
            {
               this.dynamicAttr(param1);
            }
            if(this._itemTipData2 != null && !this._itemTipData2.isAppendData)
            {
               this.dynamicAttr(param3);
            }
         }
         else if(param1 is Skill || param1 is Buff)
         {
            this._itemTipData1 = new ItemTipData(param1,0,param4);
         }
         else if(param1 is McBaseItem)
         {
            this._itemTipData1 = new ItemTipData(param1);
         }
         this.showTip();
      }
      
      private function dynamicAttr(param1:BaseItem) : void
      {
         if(!param1 || !(param1 as Goods))
         {
            return;
         }
         if(param1 is McBaseItem)
         {
            return;
         }
         var _loc2_:Goods = param1 as Goods;
         var _loc3_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_.id);
         if((param1 as Goods).roleID == -99)
         {
            this.itemSender.send_50131([_loc2_.id,_loc2_.position]);
         }
         else if((param1 as Goods).roleID == -800)
         {
            this.itemSender.send_50133({
               "index":_loc2_.position,
               "type":0
            });
         }
         else if((param1 as Goods).roleID == -801)
         {
            this.itemSender.send_50133({
               "index":_loc2_.position,
               "type":1
            });
         }
         else if((param1 as Goods).roleID == -111)
         {
            this.itemSender.send_60105(_loc2_.position);
         }
         else if((param1 as Goods).roleID == -100)
         {
            this.itemSender.send_60105(_loc2_.position);
         }
         else if((param1 as Goods).roleID == -110)
         {
            this.itemSender.send_60207([_loc2_.hushenfuIndex,_loc2_.position]);
         }
         else if(_loc2_.position >= 310 && _loc2_.position <= 320)
         {
            this.itemSender.send_50101([_loc2_.roleID,_loc2_.position,_loc2_.girID,_loc2_.id]);
         }
         else
         {
            this.itemSender.send_50101([_loc2_.roleID,_loc2_.position,_loc2_.mountID,_loc2_.id]);
         }
      }
      
      private function showTip() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Sprite = null;
         var _loc3_:Number = NaN;
         Fun.clearChildren(GameInstance.uiInstance.toolTipContainer);
         _loc1_ = this._itemTipData1.showTip;
         _loc1_.name = "itemTip1";
         GameInstance.uiInstance.toolTipContainer.addChild(_loc1_);
         if(this._itemTipData2 != null)
         {
            _loc2_ = this._itemTipData2.showTip;
            _loc2_.name = "itemTip2";
            GameInstance.uiInstance.toolTipContainer.addChild(_loc2_);
         }
         if(_loc2_ != null)
         {
            if(_loc1_.width + _loc2_.width + 10 > GameConfig.sceneWidth - this._currentItemPos.x - 35)
            {
               _loc1_.x = this._currentItemPos.x - _loc1_.width;
               _loc2_.x = this._currentItemPos.x - 10 - _loc1_.width - _loc2_.width;
            }
            else
            {
               _loc1_.x = this._currentItemPos.x + 35;
               _loc2_.x = this._currentItemPos.x + 35 + 10 + _loc1_.width;
            }
            _loc3_ = _loc1_.height > _loc2_.height ? _loc1_.height : _loc2_.height;
            if(_loc3_ > GameConfig.sceneHeight - this._currentItemPos.y - 35)
            {
               _loc1_.y = _loc2_.y = this._currentItemPos.y - _loc1_.height;
            }
            else
            {
               _loc1_.y = _loc2_.y = this._currentItemPos.y + 5;
            }
            if(_loc1_.y < 0)
            {
               _loc1_.y = 20;
               _loc2_.y = _loc1_.y;
            }
         }
         else
         {
            if(_loc1_.width > GameConfig.sceneWidth - this._currentItemPos.x - 35)
            {
               _loc1_.x = this._currentItemPos.x - _loc1_.width;
            }
            else
            {
               _loc1_.x = this._currentItemPos.x + 35;
            }
            if(_loc1_.height > GameConfig.sceneHeight - this._currentItemPos.y - 35)
            {
               _loc1_.y = this._currentItemPos.y - _loc1_.height;
            }
            else
            {
               _loc1_.y = this._currentItemPos.y + 5;
            }
            if(_loc1_.y < 0)
            {
               _loc1_.y = 20 + 100;
            }
         }
      }
      
      public function clear() : void
      {
         if(!this._itemTipData1)
         {
            return;
         }
         this._itemTipData1 = null;
         this._itemTipData2 = null;
         Fun.clearChildrenByName(GameInstance.uiInstance.toolTipContainer,"itemTip1");
         Fun.clearChildrenByName(GameInstance.uiInstance.toolTipContainer,"itemTip2");
      }
      
      private function getDataXML(param1:int) : XML
      {
         return this._itemTipArr[param1];
      }
      
      public function updateItemTip(param1:Array) : void
      {
         var _loc2_:ItemTipData = null;
         if(param1[6] >= ItemPositionRange.QIANKUN_RANGE.x && param1[6] < ItemPositionRange.QIANKUN_RANGE.y)
         {
            _loc2_ = this._qiankunItemTipObj[param1[6]];
         }
         else if(param1[6] >= ItemPositionRange.BAOXIANG_RANGE.x && param1[6] < ItemPositionRange.BAOXIANG_RANGE.y)
         {
            _loc2_ = this._baoxiangItemTipObj[param1[6]];
         }
         else if(param1[6] >= ItemPositionRange.SHELIZI_RANGE.x && param1[6] < ItemPositionRange.SHELIZI_RANGE.y)
         {
            _loc2_ = this._huShenFu_SheLiZiItemTipObj[param1[6]];
         }
         else if(param1[6] == -800)
         {
            _loc2_ = this._nextLevelEquTipData;
         }
         else if(param1[6] >= ItemPositionRange.GOODS_IN_STORAGE_RANGE.x && param1[6] < ItemPositionRange.GOODS_IN_STORAGE_RANGE.y)
         {
            _loc2_ = this._itemTipArr[param1[6]];
         }
         else if(param1[7] >= ItemPositionRange.SHOUYUAN_RANGE.x && param1[7] < ItemPositionRange.SHOUYUAN_RANGE.y && param1[8] == GameInstance.mainChar.id)
         {
            _loc2_ = this._baoxiangItemTipObj[param1[6]];
         }
         else
         {
            if(param1[8] == GameInstance.mainChar.id)
            {
               _loc2_ = this._itemTipArr[param1[6]];
            }
            else
            {
               _loc2_ = this._otherItemTipObj[param1[6]];
            }
            if(_loc2_ == null)
            {
               _loc2_ = this._npcItemTipObj[param1[6]];
            }
         }
         if(!_loc2_)
         {
            this.removeTipAll();
            return;
         }
         _loc2_.appendData = param1;
         if(_loc2_ == this._itemTipData1)
         {
            this.showTip();
         }
         else if(_loc2_ == this._itemTipData2)
         {
            this.showTip();
         }
      }
      
      public function removeTip(param1:int) : void
      {
         var _loc2_:ItemTipData = this._itemTipArr[param1];
         if(_loc2_ != null)
         {
            _loc2_.destroy();
            this._itemTipArr[param1] = null;
            delete this._itemTipArr[param1];
         }
      }
      
      public function removeTipAll() : void
      {
         this.clear();
         this._itemTipArr = new Object();
         this._otherItemTipObj = new Object();
         this._npcItemTipObj = new Object();
         this._baoxiangItemTipObj = new Object();
         this._huShenFu_SheLiZiItemTipObj = new Object();
         this._qiankunItemTipObj = {};
      }
   }
}

