CREATE OR REPLACE FUNCTION INSERT_SIZES_ITEM_PIZZA(
) RETURNS TRIGGER AS $$ 
	$$ DECLARE product_id INT;
	BEGIN -- Verifica se o item inserido é uma pizza
	IF NEW.item_type = 'pizza' THEN -- Declara um cursor para iterar sobre os itens do complemento
	FOR product_id IN
	SELECT id
	FROM products
	WHERE
	    complement_pizza_id = NEW.complement_id
	LOOP -- Cria um tamanho para cada item encontrado
	INSERT INTO
	    sizes (
	        product_id,
	        item_id,
	        establishment_id
	    )
	VALUES (
	        product_id,
	        new.id,
	        NEW.establishment_id
	    );
	END LOOP;
	RAISE NOTICE 'Inserção de tamanhos para o item conculida com sucesso!';
	END IF;
	RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;


CREATE TRIGGER AFTER_INSERT_ITEM_PIZZA 
	after_insert_item_pizza AFTER
	INSERT ON items FOR EACH ROW
	EXECUTE
	    FUNCTION insert_sizes_item_pizza();
