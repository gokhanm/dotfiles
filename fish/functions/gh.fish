function gh
    set -l function_dir ~/.config/fish/functions 

    if test -d "$function_dir"
        for file in "$function_dir"/*.fish
            set -l func_name (basename "$file" .fish)

            type $func_name|grep "description"
        end
    else
        echo "Hata: Fish fonksiyon dizini bulunamadı: $function_dir"
    end
end
