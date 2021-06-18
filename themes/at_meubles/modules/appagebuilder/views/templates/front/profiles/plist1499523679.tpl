{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
  <div class="thumbnail-container">
    <div class="product-image">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_thumbnail'}
{if isset($cfg_product_list_image) && $cfg_product_list_image}
	<div class="leo-more-info" data-idproduct="{$product.id_product}"></div>
{/if}
<a href="{$product.url}" class="thumbnail product-thumbnail">
  <img
    class="img-fluid"
	src = "{$product.cover.bySize.home_default.url}"
	alt = "{$product.cover.legend}"
	data-full-size-image-url = "{$product.cover.large.url}"
  >
  {if isset($cfg_product_one_img) && $cfg_product_one_img}
	<span class="product-additional" data-idproduct="{$product.id_product}"></span>
  {/if}
</a> 
{/block}


<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_flags'}
<ul class="product-flags">
  {foreach from=$product.flags item=flag}
	<li class="product-flag {$flag.type}">{$flag.label}</li>
  {/foreach}
  {block name='product_price_and_shipping'}
	{if $product.show_price}
		{if $product.has_discount}
			{if $product.discount_type === 'percentage'}
	          <li class="product-flag custom-discount discount-percentage">{$product.discount_percentage}</li>
	        {elseif $product.discount_type === 'amount'}
	          <li class="product-flag custom-discount discount-amount discount-product">{$product.discount_amount_to_display}</li>
	        {/if}
		{/if}
	{/if}
{/block}
</ul>
{/block}
<div class="functional-buttons clearfix">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
<div class="quickview{if !$product.main_variants} no-variants{/if} hidden-md-down">
	<a
	href="#"
	class="quick-view btn-product btn"
	data-link-action="quickview"
	title="{l s='Quick view' d='Shop.Theme.Actions'}"
	>
	<span class="leo-quickview-bt-loading cssload-speeding-wheel"></span>
	<span class="leo-quickview-bt-content">
		<i class="fa fa-eye"></i> <span>{l s='Quick view' d='Shop.Theme.Global'}</span>
	</span>
</a>
</div>

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoWishlistButton' product=$product}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCompareButton' product=$product}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCartButton' product=$product}
</div></div>
    <div class="product-meta"><div class="product-description"><div class="box-name-review">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_name'}
  <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
{/block}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoProductListReview' product=$product}
</div><div class="box-price">
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{block name='product_price_and_shipping'}
  {if $product.show_price}
    <div class="product-price-and-shipping {if $product.has_discount}has_discount{/if}">
      {if $product.has_discount}
        {hook h='displayProductPriceBlock' product=$product type="old_price"}
        <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
        <span class="regular-price">{$product.regular_price}</span>
      {/if}

      {hook h='displayProductPriceBlock' product=$product type="before_price"}
      
      <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
      <span class="price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        <span itemprop="priceCurrency" content="{$currency.iso_code}"></span><span itemprop="price" content="{$product.price_amount}">{$product.price}</span>
      </span>

      {hook h='displayProductPriceBlock' product=$product type='unit_price'}

      {hook h='displayProductPriceBlock' product=$product type='weight'}
    </div>
  {/if}
{/block}
</div></div>
{block name='product_description_short'}
  <div class="product-description-short" itemprop="description">{$product.description_short|truncate:150:'...' nofilter}</div>
{/block}
<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCartAttribute' product=$product}

<!-- @file modules\appagebuilder\views\templates\front\products\file_tpl -->
{hook h='displayLeoCartQuantity' product=$product}
</div>
  </div>
</article>
